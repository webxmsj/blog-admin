<template>
  <div class="category">
    <ButtonGroup class="btns">
      <Button @click="addParentCategory">添加父分类</Button>
    </ButtonGroup>
    <div class="categorycomponent">
      <!-- @additem="" @delitem="" -->
      <category :datas="datas"></category>
    </div>
    <addcategory ref="addcategory" @confirm="addCallBack"></addcategory>
  </div>
</template>

<script>
import category from '@/components/category/category.vue'
import addcategory from './addcategory.vue'
import { queryall, addCategory, deleteCategory } from '@/api/getdatas'
import { transformorigincategorys } from '@/libs/util'
export default {
  components: {
    category,
    addcategory
  },
  data () {
    return {
      datas: [],
      newitem: {
        name: '',
        description: ''
      },
      newpath: ''
    }
  },
  methods: {
    getCurrentByClassline (classline) {
      var res
      if (classline.indexOf(',') > -1) {
        var arr = classline.split(',')
        var i = 0
        while (i < arr.length) {
          res = res ? res['children'][arr[i]] : this.datas[arr[i]]
          i++
        }
      } else {
        this.datas.forEach((item, index) => {
          if (item.path === classline) {
            res = this.datas[index]
          }
        })
      }
      return res
    },
    getParentByClassline (classline) {
      var arr = classline.split(',')
      arr.pop()
      var i = 0
      var res
      while (i < arr.length) {
        res = res ? res['children'][arr[i]] : this.datas[arr[i]]
        i++
      }
      return res
    },
    addParentCategory () {
      console.log('添加父级分类')
      this.$refs.addcategory.changeStatus('parent')
    },
    addParentCallBack (data) {
      if (this.datas.length === 0) {
        data.path = 0
      } else {
        var patharr = this.datas.map(item => {
          return item.path
        })
        if (!data.path) {
          data.path = Math.max.apply(null, patharr) + 1
        }
      }
      addCategory(data).then(res => {
        this.datas.push(res.data[0])
      })
    },
    addCallBack (flag, data) {
      if (flag === 'child') {
        this.addChildCallBack(data)
      } else {
        this.addParentCallBack(data)
      }
    },
    addChildCallBack (data) {
      addCategory({
        ...data,
        path: this.newpath
      }).then(res => {
        console.log('添加成功', res)
        var newpath = res.data[0]['path'].split(',')
        newpath.pop()
        let parentres = this.getCurrentByClassline(newpath.join(','))
        if (!parentres['children']) {
          parentres['children'] = []
        }
        parentres['children'].push(res.data[0])
        this.newpath = ''
      })
    }
  },
  beforeMount () {
    // 获取文章分类
    queryall('blog_category').then(res => {
      if (res.status === 200) {
        this.datas = transformorigincategorys(res.data)
      } else {
        console.log('请求失败')
      }
    })
  },
  mounted () {
    this.$bus.$on('additem', path => {
      let length
      let currentres = this.getCurrentByClassline(path)
      if (!currentres['children']) {
        length = 0
      } else {
        length = currentres['children'].length
      }
      this.newpath = path + ',' + length
      this.$refs.addcategory.changeStatus('child')
    })

    this.$bus.$on('delitem', data => {
      var currentres = this.getCurrentByClassline(data.path)
      var parentres = this.getParentByClassline(data.path)
      if (currentres.children) {
        this.$Modal.warning({
          title: '请谨慎删除',
          content: '你确定删除当前类别下所有子分类吗？',
          onOk: () => {
            function getid (obj) {
              result.push(obj.id)
              if (obj['children']) {
                obj['children'].forEach(item => {
                  getid(item)
                })
              }
            }
            let result = []
            getid(currentres)
            deleteCategory(result).then(res => {
              console.log('多个类别删除成功')
            })
          }
        })
      } else {
        let arr = data.path.split(',')
        parentres['children'].splice(arr[arr.length - 1], 1)
        deleteCategory([
          data.id
        ]).then(res => {
          console.log('删除分类成功', res)
        })
      }
    })

    this.$bus.$on('edititem', data => {
      var currentres = this.getCurrentByClassline(data.path)
      this.newpath = currentres.path
      this.$refs.addcategory.getdatas(currentres)
      this.$refs.addcategory.changeStatus('child')
    })
  }
}
</script>
<style lang="less">
.category{
  .btns{
    margin-bottom: 15px;
  }
}
.categorycomponent{
  width: 360px;
  border-left: 1px solid #dcdee2;
  border-right: 1px solid #dcdee2;
  border-bottom: 1px solid #dcdee2;
  div{
    border-left: none;
    border-right: none;
  }
  .ivu-collapse{
    border-radius: 0;
    padding-left: 20px;
    border-bottom: none;
    .btngroup{
      position: absolute;
      right: 15px;
      top: 0;
    }
    .ivu-collapse-content{
      background: none;
    }
  }
  & > div{
    & > .ivu-collapse{
      padding-left: 0;
    }
  }
}
</style>
