<template>
  <div class="users">
    <ButtonGroup>
      <Button type="success" @click="showmodal = true">添加用户</Button>
      <Button type="primary">修改用户</Button>
      <Button type="error">删除用户</Button>
    </ButtonGroup>
    <Table ref="selection" border stripe :columns="columns" :data="datas"></Table>
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
            <div class="item" @click="choserole(1)">
              <img src="../../assets/images/role.jpg" alt="普通用户">
              <p>我是普通用户</p>
              <div class="mask" :class="{active:choseindex == 1}">
                <Icon type="md-checkmark-circle-outline" />
              </div>
            </div>
          </Col>
          <Col span="6">
            <div class="item" @click="choserole(2)">
              <img src="../../assets/images/role.jpg" alt="管理员">
              <p>我是管理员</p>
              <div class="mask" :class="{active:choseindex == 2}">
                <Icon type="md-checkmark-circle-outline" />
              </div>
            </div>
          </Col>
          <Col span="6">
            <div class="item" @click="choserole(3)">
              <img src="../../assets/images/role.jpg" alt="超级管理员">
              <p>我是超级管理员</p>
              <div class="mask" :class="{active:choseindex == 3}">
                <Icon type="md-checkmark-circle-outline" />
              </div>
            </div>
          </Col>
        </Row>
        <Row type="flex" justify="end">
          <Col span="24">
            <Button type="info" @click="step += 1">下一步</Button>
          </Col>
        </Row>
      </div>
      <div v-show="step === 1" class="information">
        <div style="margin-top: 6px">
          <Row class="field">
            <Col span="8">
              <p>用户名：</p>
            </Col>
            <Col span="16">
              <Input placeholder="请输入用户名" style="width: auto" v-model="information.username"></Input>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>用户昵称：</p>
            </Col>
            <Col span="16">
              <Input placeholder="请输入用户昵称" style="width: auto" v-model="information.nickname"></Input>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>登录密码：</p>
            </Col>
            <Col span="16">
              <Input placeholder="请输入登录密码" style="width: auto" v-model="information.oncepassword"></Input>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>再次输入登录密码：</p>
            </Col>
            <Col span="16">
              <Input placeholder="请再次输入登录密码" style="width: auto" v-model="information.secondpassword"></Input>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>头像：</p>
            </Col>
            <Col span="16">
              <div class="useravatar">
                <Upload
                  :show-upload-list="false"
                  :format="['jpg','jpeg','png']"
                  :max-size="2048"
                  :before-upload="uploadBanner"
                  :on-format-error="pc1FormatError"
                  multiple
                  type="drag"
                  action="">
                  <div style="width: 200px;height:200px;line-height:200px;text-align: center;">
                      <p>点击上传图片</p>
                  </div>
                </Upload>
                <div class="mask" v-if="information.useravatar" :style="{backgroundImage: 'url('+ information.useravatar +')'}">
                  <p><span>重新上传</span></p>
                </div>
              </div>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>性别：</p>
            </Col>
            <Col span="16">
              <RadioGroup v-model="information.sex">
                <Radio label="0">保密</Radio>
                <Radio label="1">男</Radio>
                <Radio label="2">女</Radio>
              </RadioGroup>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>生日：</p>
            </Col>
            <Col span="16">
              <DatePicker
                      :open="open"
                      :value="information.birthday"
                      confirm
                      type="date"
                      @on-change="changebirthday"
                      @on-clear="open = false"
                      @on-ok="open = false">
                      <a href="javascript:void(0)" @click="chosebirthday">
                      <Icon type="ios-calendar-outline"></Icon>
                      <template v-if="information.birthday === ''">请选择日期</template>
                      <template v-else>{{ information.birthday }}</template>
                  </a>
              </DatePicker>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>个性签名：</p>
            </Col>
            <Col span="16">
              <Input placeholder="请输入个性签名" style="width: auto" v-model="information.signature"></Input>
            </Col>
          </Row>
          <Row class="field">
            <Col span="8">
              <p>个人网址：</p>
            </Col>
            <Col span="16">
              <Input placeholder="请输入个人网址" style="width: auto" v-model="information.website"></Input>
            </Col>
          </Row>
        </div>
        <Button type="info" @click="submitdatas">下一步</Button>
      </div>
      <!-- /send_mail -->
      <div v-show="step === 2" class="mailcontainer">
          发送邮件
          <Input v-model="email" placeholder="请输入邮箱"></Input>
          <Button @click="sendmail">发送邮件</Button>
      </div>
    </Modal>
  </div>
</template>
<script>
import { getDisplayStructure, queryall, uploadFile, sendMail, addUser } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
export default {
  data () {
    return {
      columns: [],
      datas: [],
      showmodal: false,
      step: 0,
      choseindex: 1,
      open: false,
      information: {
        id: '',
        sex: 0,
        username: '',
        nickname: '',
        birthday: '',
        useravatar: '',
        website: '',
        signature: '',
        oncepassword: '',
        secondpassword: ''
      },
      email: ''
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
    uploadBanner (file) {
      var that = this
      var reader = new FileReader()
      let formData = new FormData()
      reader.onload = function (e) {
        var img = new Image()
        img.src = e.target.result
        img.onload = function () {
          formData.append('file', file)
          uploadFile(formData).then(res => {
            that.information.useravatar = 'http://qiniu.bfrontend.com/' + res.data
            console.log('上传成功', res.data)
          })
        }
      }
      reader.readAsDataURL(file)
    },
    pc1FormatError (file) {
      console.log('文件格式不正确', file.name)
    },
    modalChange (flag) {
      if (!flag) {
        this.step = 0
      }
    },
    jumpTo (to) {
      if (this.step > to) {
        this.step = to
      }
    },
    choserole (index) {
      this.choseindex = index
      // auto go next step
      // this.step += 1
    },
    changebirthday (date) {
      this.information.birthday = date
    },
    chosebirthday () {
      this.open = !this.open
    },
    submitdatas () {
      this.step += 1
      addUser({
        role: this.choseindex,
        ...this.information
      }).then(res => {
        this.information.id = res.data.id
        console.log('新增用户成功', res)
      })
    },
    sendmail () {
      sendMail({
        user: this.information.username,
        email: this.email,
        id: this.information.id
      }).then(res => {
        console.log(res)
      }).catch(err => {
        console.log(err)
      })
      console.log('send mail')
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
    .item{
      position: relative;
      width: 150px;
      height: 150px;
      border-radius: 100%;
      overflow: hidden;
      margin: auto;
      img{
        width: 100%;
        height: 100%;
        display: block;
      }
      p{
        margin-bottom: 100px;
        font-size: 18px;
      }
      .mask{
        transition: all .3s linear;
        opacity: 0;
        position: absolute;
        left: 0;
        top: 0;
        height: 100%;
        width: 100%;
        background: rgba(0,0,0,.6);
        display: flex;
        justify-content: center;
        align-items: center;
        &.active{
          opacity: 1;
        }
        .ivu-icon{
          font-size: 40px;
          color: #fff;
        }
      }
    }
  }
}
.information{
  width: 40%;
  margin: 0 auto;
  .field{
    margin: 10px 0;
    p{
      text-align: right;
      line-height: 32px;
    }
    .useravatar{
      width: 200px;
      height: 200px;
      text-align: center;
      position: relative;
      p{
        text-align: center;
        line-height: 200px;
      }
      .mask{
        background-size: cover;
        background-position: center;
        position:absolute;
        left:0;
        top:0;
        height:100%;
        width: 100%;
        z-index: 2;
        p{
          display: block;
          transition: all .6s linear;
          opacity: 0;
          color: #fff;
          text-align: center;
          line-height: 200px;
          height: 200px;
          span{
            cursor: pointer;
            padding: 5px 0;
            margin: 0 10px;
          }
        }
        &:hover{
          p{
            opacity: 1;
            background: rgba(0,0,0,.5);
          }
        }
      }
    }
  }
}

</style>
