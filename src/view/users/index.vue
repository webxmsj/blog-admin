<template>
  <div class="users">
    <ButtonGroup>
      <Button type="success" @click="showmodal = true">添加用户</Button>
      <Button type="primary">修改用户</Button>
      <Button type="error">删除用户</Button>
    </ButtonGroup>
    <Table ref="selection" border :columns="columns" :data="datas"></Table>
    <Modal v-model="showmodal" fullscreen title="新建用户只需简单几步" @on-visible-change="modalChange">
      <Steps class="newuser" :current="step">
        <Step title="选择角色" icon="ios-contact" @click.native="jumpTo(0)"></Step>
        <Step title="基本信息" icon="ios-map" @click.native="jumpTo(1)"></Step>
        <Step title="邮箱验证" icon="ios-mail" @click.native="jumpTo(2)"></Step>
        <Step title="手机验证" icon="ios-phone-portrait" @click.native="jumpTo(3)"></Step>
        <Step title="注册成功" icon="ios-checkmark-circle" @click.native="jumpTo(4)"></Step>
      </Steps>
      <div v-show="step === 0" class="role">
        <Row type="flex" justify="center">
          <Col span="6">
            <img src="../../assets/images/role.jpg" alt="普通用户">
            <p>我是普通用户</p>
          </Col>
          <Col span="6">
            <img src="../../assets/images/role.jpg" alt="管理员">
            <p>我是管理员</p>
          </Col>
          <Col span="6">
            <img src="../../assets/images/role.jpg" alt="超级管理员">
            <p>我是超级管理员</p>
          </Col>
        </Row>
        <Row type="flex" justify="end">
          <Col span="24">
            <Button type="info" @click="step += 1">下一步</Button>
          </Col>
        </Row>
      </div>
      <div v-show="step === 1">
        基本信息
        <Button type="info" @click="step += 1">下一步</Button>
      </div>
    </Modal>
  </div>
</template>
<script>
import { getDisplayStructure, queryall } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      columns: [],
      datas: [],
      showmodal: false,
      step: 0
    }
  },
  beforeMount () {
    // 获取 用户表对应表显示字段结构
    getDisplayStructure('blog_user').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data)
        this.columns.unshift({
          type: 'selection',
          width: 60,
          align: 'center'
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
    modalChange (flag) {
      if (!flag) {
        this.step = 0
      }
    },
    jumpTo (to) {
      if (this.step > to) {
        this.step = to
      }
    }
  }
}
</script>

<style lang="less">
.users{
  .ivu-btn-group{
    margin-bottom: 20px;
  }
}
.ivu-steps.newuser{
  text-align: center;
  .ivu-steps-item{
    .ivu-steps-tail{
      padding: 0;
    }
    &.ivu-steps-status-finish {
      .ivu-steps-tail > i:after{
        left: 0;
      }
    }
    &:last-child {
      .ivu-steps-tail{
        display: block;
      }
    }
  }
}
.role{
  margin-top: 80px;
  .ivu-col{
    text-align: center;
    overflow: hidden;
    padding: 15px 0;
    margin-bottom: 50px;
    img{
      margin-top: 100px;
      display: inline-block;
      width: 150px;
      height: 150px;
      border-radius: 100%;
    }
    p{
      margin-bottom: 100px;
      font-size: 18px;
    }
  }
}

</style>
