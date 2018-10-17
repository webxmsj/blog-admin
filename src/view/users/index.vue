<template>
  <div class="users">
    <ButtonGroup>
      <Button type="success" @click="changemodal('adduser')">添加用户</Button>
    </ButtonGroup>
    <Table ref="selection" border stripe :columns="columns" :data="datas"></Table>
    <AddUser ref="adduser"></AddUser>
    <UpdateUser ref="updateuser"></UpdateUser>
  </div>
</template>
<script>
import { getDisplayStructure, queryall, deleteUser } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
import AddUser from './adduser.vue'
import UpdateUser from './updateuser.vue'
export default {
  components: {
    AddUser,
    UpdateUser
  },
  data () {
    return {
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    // 获取 用户表对应表显示字段结构
    getDisplayStructure('blog_user').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data)
        let that = this
        this.columns.push({
          title: '操作',
          key: 'action',
          width: 130,
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
                    click: function (event) {
                      that.changemodal('updateuser', params.row)
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
                    click () {
                      that.deleteuser(params.row.id)
                    }
                  }
                },
                '删除'
              )
            ])
          }
        })
      } else {
        console.log('请求 users 失败')
      }
    })
    // 获取原始的分类对应表数据
    queryall('blog_user').then(res => {
      if (res.status === 200) {
        this.datas = res.data
      } else {
        console.log('获取文章分类错误')
      }
    })
  },
  methods: {
    changemodal (ref, data) {
      this.$refs[ref].changestatus()
      if (data) {
        this.$refs[ref].setdatas(data)
      }
    },
    deleteuser (id) {
      deleteUser(id).then(res => {
        console.log('删除用户成功', res)
      })
    }
  }
}
</script>

<style lang="less">
.users{
  .ivu-btn-group{
    margin-bottom: 20px;
  }
  .ivu-table-cell{
    max-height: 32px;
    overflow: auto;
  }
  th{
    text-align: center;
  }
}
</style>
