<template>
  <div class="links">
    <ButtonGroup>
      <Button type="success" @click="showaddlink">添加链接</Button>
    </ButtonGroup>
    <AddLink ref="addlink" @success="reload"></AddLink>
    <Table :loading="loading" :columns="columns" :data="datas"></Table>
  </div>
</template>
<script>
import { queryall, getDisplayStructure, hideOrDeleteLink } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
import AddLink from './addlink.vue'
export default {
  components: {
    AddLink
  },
  data () {
    return {
      loading: true,
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    this.handleQueryAll()
    // 获取表结构
    getDisplayStructure('blog_link').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data)
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
                    click: event => {
                      this.hidelink(params.row.id)
                    }
                  }
                },
                '隐藏'
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
                      this.showaddlink()
                      this.$refs.addlink.setdatas(params.row)
                    }
                  }
                },
                '修改'
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
                      this.deletelink(params.row.id)
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
    showaddlink () {
      this.$refs.addlink.changestatus()
    },
    handleQueryAll () {
      queryall('blog_link').then(res => {
        if (res.status === 200) {
          this.loading = false
          this.datas = res.data
        } else {
          console.log('表格数据加载失败')
        }
      })
    },
    reload () {
      this.handleQueryAll()
    },
    // 隐藏 当前链接
    hidelink (id) {
      hideOrDeleteLink({
        id,
        flag: 'hide'
      }).then(res => {
        console.log('隐藏链接成功', res)
      })
    },
    // 删除链接
    deletelink (id) {
      hideOrDeleteLink({
        id,
        flag: 'delete'
      }).then(res => {
        this.handleQueryAll()
        console.log('删除链接成功', res)
      })
    }
  }
}
</script>
<style lang="less">
.ivu-btn-group{
  margin-bottom: 20px;
}
</style>
