<template>
  <Modal v-model="isshow" fullscreen title="修改用户信息" @on-ok="okhandle">
    <div class="information">
      <Row class="field">
        <Col span="8">
          <p>用户角色：</p>
        </Col>
        <Col span="16">
          <RadioGroup v-model="information.role" type="button">
            <Radio label="1">普通用户</Radio>
            <Radio label="2">管理员</Radio>
            <Radio label="3">超级管理员</Radio>
          </RadioGroup>
        </Col>
      </Row>
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
          <p>原密码：</p>
        </Col>
        <Col span="16">
          <Input placeholder="请输入登录密码" style="width: auto" v-model="temppassword.original" @on-blur="checkisright">
            <span slot="append">
              <Icon v-show="!originalstatus" color="orange" type="ios-alert" />
              <Icon v-show="originalstatus" color="green" type="ios-checkmark-circle" />
            </span>
          </Input>
        </Col>
      </Row>
      <Row class="field">
        <Col span="8">
          <p>新密码：</p>
        </Col>
        <Col span="16">
          <Input placeholder="请输入登录密码" style="width: auto" v-model="temppassword.newpassword" @on-blur="checkpassword">
          </Input>
        </Col>
      </Row>
      <Row class="field">
        <Col span="8">
          <p>头像：</p>
        </Col>
        <Col span="16">
          <div class="useravatar">
            <Upload
              ref="avatar"
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
              <p><span @click="reupload">重新上传</span></p>
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
  </Modal>
</template>
<script>
import { addOrUpdateUser, checkpassword, uploadFile } from '@/api/getdatas'
export default {
  data () {
    return {
      isshow: false,
      open: false,
      information: {
        id: '',
        sex: 0,
        role: '',
        username: '',
        nickname: '',
        birthday: '',
        useravatar: '',
        website: '',
        signature: '',
        password: ''
      },
      originalstatus: false,
      temppassword: {
        original: '',
        newpassword: ''
      }
    }
  },
  methods: {
    changestatus () {
      this.isshow = !this.isshow
    },
    reupload () {
      this.$refs.avatar.handleClick()
    },
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
            that.information.useravatar = 'http://img.bfrontend.com/' + res.data
            console.log('上传成功', res.data)
          })
        }
      }
      reader.readAsDataURL(file)
    },
    pc1FormatError (file) {
      console.log('文件格式不正确', file.name)
    },
    changebirthday (date) {
      this.information.birthday = date
    },
    chosebirthday () {
      this.open = !this.open
    },
    setdatas (data) {
      this.information.id = data.id
      this.information.sex = data.sex + ''
      this.information.username = data.user_login
      this.information.nickname = data.user_nickname
      this.information.birthday = data.birthday
      this.information.useravatar = data.avatar
      this.information.website = data.user_url
      this.information.signature = data.signature
      this.information.role = data.user_type + ''
      this.information.password = ''
    },
    checkisright () {
      // 检验输入的 原始密码是否正确
      checkpassword({
        id: this.information.id,
        password: this.temppassword.original
      }).then(res => {
        if (res.data.isright) {
          this.originalstatus = true
          console.log('密码正确')
        } else {
          this.originalstatus = false
          console.log('检查原始密码是否正确')
        }
      })
    },
    checkpassword () {
      if (!this.originalstatus) {
        console.log('原密码不正确,请重新输入')
      } else {
        this.information.password = this.temppassword.newpassword
      }
    },
    okhandle () {
      addOrUpdateUser(this.information).then(res => {
        console.log('修改用户信息成功', res)
      })
    }
  }
}
</script>
