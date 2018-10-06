<template>
  <div>
    <ButtonGroup>
      <Button type="success">添加用户</Button>
      <Button type="primary">修改用户</Button>
      <Button type="error">删除用户</Button>
    </ButtonGroup>
    <Table ref="selection" border :columns="columns" :data="datas"></Table>
  </div>
</template>
<script>
export default {
  data () {
    return {
      columns: [{
        type: 'selection',
        width: 60,
        align: 'center'
      }, {
        title: '编号',
        key: 'id'
      }, {
        title: '账号',
        key: 'name'
      }, {
        title: '性别',
        key: 'sex'
      }, {
        title: '生日',
        key: 'birthday'
      }, {
        title: 'QQ',
        key: 'qq'
      }, {
        title: '邮箱',
        key: 'email'
      }, {
        title: '手机',
        key: 'phone'
      }, {
        title: '加入时间',
        key: 'joinTime'
      }, {
        title: '权限',
        key: 'power'
      }],
      datas: [{
        id: 0,
        name: '李四',
        sex: '男',
        birthday: '1994-02-24',
        qq: '951216388',
        email: '17625492424@163.com',
        phone: '17625492424',
        joinTime: '2018-10-05',
        power: 0
      }, {
        id: 1,
        name: '王五',
        sex: '女',
        birthday: '1994-02-24',
        qq: '951216388',
        email: '17625492424@163.com',
        phone: '17625492424',
        joinTime: '2018-10-05',
        power: 0
      }]
    }
  }
}
</script>
