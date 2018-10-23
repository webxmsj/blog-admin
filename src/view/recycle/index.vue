<template>
  <div>
    <Table :columns="columns" :data="datas"></Table>
  </div>
</template>
<script>
import { queryall, getDisplayStructure } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      name: '',
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    queryall('blog_recycle_bin').then(res => {
      if (res.status === 200) {
        this.loading = false
        this.datas = res.data
      } else {
        console.log('表格数据加载失败')
      }
    })
    // 获取表结构
    getDisplayStructure('blog_recycle_bin').then(res => {
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
                      // this.hidelink(params.row.id)
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
                      // this.showaddlink()
                      // this.$refs.addlink.setdatas(params.row)
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
                      // this.deletelink(params.row.id)
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
  }
}
</script>
<style lang="less">

</style>
