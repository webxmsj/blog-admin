<template>
  <div class="categorycomponent">
    <category :datas="datas"></category>
  </div>
</template>

<script>
import category from '@/components/category/category.vue'
import Bus from '@/components/category/bus'
export default {
  components: {
    category
  },
  data () {
    return {
      datas: [{
        name: '文化',
        description: '文人墨客的世界',
        key: 'culture',
        classline: '0',
        children: [{
          name: '历史',
          description: '中华上下五千年的历史',
          key: 'history',
          classline: '0,0'
        }, {
          name: '哲学',
          description: '哲学者的世界我们不懂',
          key: 'philosophy',
          classline: '0,1'
        }]
      }, {
        name: '生活',
        description: '品味生活,享受生活',
        key: 'life',
        classline: '1',
        children: [{
          name: '旅行',
          description: '身体和灵魂总有一个在路上',
          key: 'travel',
          classline: '1,0',
          children: [{
            name: '在路上',
            description: '走出去,你将看到这个精彩的世界',
            key: 'category2-1',
            classline: '1,0,0'
          }, {
            name: '自助游',
            description: '带着自己的爱车,说走就走，说停就停',
            key: 'category2-2',
            classline: '1,0,1',
            children: [{
              name: '朋友',
              description: '朋友一生一起走',
              key: 'category2-1',
              classline: '1,0,1,0'
            }, {
              name: '同事',
              description: '相互帮助,相互鼓励,是同事情',
              key: 'category2-2',
              classline: '1,0,1,1'
            }, {
              name: '父母',
              description: '父母在哪,家在哪,那是我永远的避风港湾',
              key: 'category2-2',
              classline: '1,0,1,2'
            }]
          }]
        }, {
          name: '励志',
          description: '偶尔还是要喝一些鸡汤的,万一实现了呢',
          key: 'category2-2',
          classline: '1,1'
        }]
      }],
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
