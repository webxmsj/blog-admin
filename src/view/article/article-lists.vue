<template>
  <div class="articlelist">
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
    this.queryAllPost()
    // 获取表结构
    getDisplayStructure('blog_post').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data, {
          post_thumb: {
            render: (h, params) => {
              return h('img', {
                attrs: {
                  src: params.row.post_thumb
                },
                on: {
                  click: (e) => {
                    var imgObj = {
                      src: e.target.src
                    }
                    this.$Modal.info({
                      okText: '关闭',
                      closable: true,
                      width: 600,
                      render: (h) => {
                        return h('img', {
                          style: {
                            display: 'block',
                            width: '100%',
                            height: 'auto',
                            maxWidth: '100%',
                            maxHeight: '100%'
                          },
                          domProps: {
                            src: imgObj.src
                          },
                          on: {
                            click: () => {
                              imgObj.src = ''
                            }
                          }
                        })
                      }
                    })
                  }
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
                    click: () => {
                      this.prewPost(params.row.id)
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
    queryAllPost() {
      queryall('blog_post').then(res => {
        if (res.status === 200) {
          this.datas = res.data
        } else {
          console.log('表格数据加载失败')
        }
      })
    },
    // 删除文章
    deletePost (id) {
      this.$Modal.confirm({
          title: '提示',
          content: '确定要删除该文章吗？',
          onOk: () => {
            deletePost(id).then(res => {
              this.$Message.success('删除成功');
              this.queryAllPost()
            })
          },
          onCancel: () => {
              this.$Message.info('取消删除');
          }
      });
    },
    prewPost (id) {
      window.open('https://blog.bfrontend.com/blog/article/' + id)
      // console.log(id)
    }
  }
}
</script>

<style lang="less">
.articlelist{
  .ivu-table-cell{
    max-height: 52px;
    height: 100%;
    text-align: center;
    display: flex;
    align-items: center;
    & > div {
      width: 100%;
    }
    img{
      display: inline-block;
      height: 100%;
      width: auto;
      max-width: 100%;
      max-height: 100%;
    }
    .ivu-table-cell-expand{
      line-height: 52px;
    }
  }
  .ivu-table-fixed-right{
    background: #fff;
  }
}
</style>
