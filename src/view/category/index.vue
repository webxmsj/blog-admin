<template>
  <div>
    <div class="categorycomponent">
      <category :datas="datas"></category>
    </div>
  </div>
</template>

<script>
import category from '@/components/category/category.vue'
import Bus from '@/components/category/bus'
import { getCategorys } from '@/api/getdatas'
export default {
  components: {
    category
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
    }
  },
  beforeMount () {
    // 获取文章分类
    getCategorys().then(res => {
      if (res.status === 200) {
        this.datas = res.data
      } else {
        console.log('请求失败')
      }
    })
  },
  mounted () {
    Bus.$on('additem', data => {
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
    })
    Bus.$on('delitem', data => {
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
    })
  }
}
</script>
<style lang="less">
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
