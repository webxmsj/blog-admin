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
import { queryall, addCategory } from '@/api/getdatas'
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
      }
    }
  },
  methods: {
    getCurrentByClassline (classline) {
      var arr = classline.split(',')
      var i = 0
      var res
      while (i < arr.length) {
        res = res ? res['children'][arr[i]] : this.datas[arr[i]]
        i++
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
      if (data.id === '') {
        data.id = this.datas.length
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
    addChildCallBack (path) {
      var newpath
      // var res = this.getCurrentByClassline(data)
      if (path.indexOf(',') > -1) {
        var arr = path.split(',')
        arr[arr.length - 1] = arr[arr.length - 1] + 1
        newpath = arr.join(',')
      } else {
        newpath = path + ',0'
      }
      console.log(newpath)
    }
  },
  beforeMount () {
    // 获取文章分类
    queryall('blog_category').then(res => {
      if (res.status === 200) {
        this.datas = res.data
      } else {
        console.log('请求失败')
      }
    })
  },
  mounted () {
    this.$bus.$on('additem', data => {
      this.$refs.addcategory.changeStatus('child')
    })
    /* Bus.$on('additem', data => {
      var newitem = {
        name: 'sdf',
        description: ''
      }
      this.$Modal.confirm({
        render: (h) => {
          return h('div', [
            h('Input', {
              props: {
                value: '',
                autofocus: true,
                placeholder: '请输入类别名称'
              },
              on: {
                input: val => {
                  newitem.name = val
                }
              }
            }),
            h('Input', {
              props: {
                value: '',
                placeholder: '请输入类别描述'
              },
              on: {
                input: val => {
                  newitem.description = val
                }
              }
            })
          ])
        },
        onOk: () => {
          var arr = data.split(',')
          var res = this.getCurrentByClassline(data)
          arr[arr.length - 1] = arr[arr.length - 1] + 1
          if (!res['children']) {
            this.$set(res, 'children', [])
          }
          res['children'].push({
            classline: arr.join(','),
            description: newitem.description,
            key: Math.random(),
            name: newitem.name
          })
        }
      })
    }) */

    /* Bus.$on('delitem', data => {
      var arr = data.split(',')
      console.log('delitem', data)
      var currentres = this.getCurrentByClassline(data)
      var parentres = this.getParentByClassline(data)
      if (currentres.children) {
        this.$Modal.warning({
          title: '请谨慎删除',
          content: '你确定删除当前类别下所有子分类吗？',
          onOk: () => {
            console.log('你确定删除所有')
          }
        })
      } else {
        console.log(parentres)
        parentres['children'].splice(arr[arr.length - 1], 1)
      }
    }) */
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
