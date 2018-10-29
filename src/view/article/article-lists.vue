<template>
  <div>
    <Table :columns="columns" :data="datas"></Table>
  </div>
</template>

<script>
import expandRow from './table-expand.vue'
import { queryall, getDisplayStructure, deletePost } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  components: {
    expandRow
  },
  data () {
    return {
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    queryall('blog_post').then(res => {
      if (res.status === 200) {
        this.datas = res.data
      } else {
        console.log('表格数据加载失败')
      }
    })
    // 获取表结构
    getDisplayStructure('blog_post').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data, {
          post_thumb: {
            render: (h, params) => {
              return h('img', {
                attrs: {
                  src: params.row.post_thumb
                }
              })
            }
          }
        })
        this.columns.unshift({
          type: 'expand',
          width: 50,
          render: (h, params) => {
            return h(expandRow, {
              props: {
                row: params.row
              }
            })
          }
        })

        this.columns.push({
          title: '操作',
          key: 'action',
          width: 160,
          fixed: 'right',
          render: (h, params) => {
            return h('div', [
              h(
                'Button',
                {
                  props: {
                    type: 'text',
                    size: 'small'
                  },
                  on: {
                    click () {
                      console.log('preview')
                    }
                  }
                },
                '预览'
              ),
              h(
                'Button',
                {
                  props: {
                    type: 'text',
                    size: 'small'
                  },
                  on: {
                    click () {
                      console.log('edit')
                    }
                  }
                },
                '编辑'
              ),
              h(
                'Button',
                {
                  props: {
                    type: 'text',
                    size: 'small'
                  },
                  on: {
                    click: () => {
                      this.deletePost(params.row.id)
                    }
                  }
                },
                '删除'
              )
            ])
          }
        })
      } else {
        console.log(res)
      }
    })
  },
  methods: {
    deletePost (id) {
      deletePost(id).then(res => {
        console.log('删除成功')
      })
    }
  }
}
</script>

<style lang="less">
.ivu-table-cell{
  max-height: 32px;
  overflow: hidden;
  img{
    display: block;
    width: 100%;
    height: auto;
  }
}
</style>
