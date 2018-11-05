<template>
  <div>
    <Table ref="selection" border :columns="columns" :data="datas"></Table>
    <Button @click="handleSelectAll(true)">全选</Button>
    <Button @click="handleSelectAll(false)">取消全选</Button>
  </div>
</template>

<script>
import { queryall, getDisplayStructure, changeStatusComment } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    // 获取表结构
    getDisplayStructure('blog_comment').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data, {
          status: {
            render: (h, { row }) => {
              return h('Select', {
                props: {
                  value: row.status
                },
                on: {
                  'on-change': (v) => {
                    this.changestatus(row.id, v)
                  }
                }
              }, [
                h('Option', {
                  props: {
                    value: 1
                  }
                }, '通过'),
                h('Option', {
                  props: {
                    value: 0
                  }
                }, '拒绝')
              ])
            }
          },
          url: {
            render: (h, { row }) => {
              return h('a', {
                attrs: {
                  href: row.url
                }
              }, row.url)
            }
          }
        })
      }
    })
    // 获取文章分类
    queryall('blog_comment').then(res => {
      if (res.status === 200) {
        this.datas = res.data
      } else {
        console.log('请求失败')
      }
    })
  },
  methods: {
    handleSelectAll (status) {
      this.$refs.selection.selectAll(status)
    },
    changestatus (id, value) {
      console.log(id, value)
      changeStatusComment({
        id,
        value
      }).then(res => {
        console.log(res)
      })
    }
  }
}
</script>
