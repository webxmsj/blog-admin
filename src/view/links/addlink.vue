<template>
  <Modal class="addlink" v-model="isshow" title="添加链接" @on-ok="submitdata">
    <Row class="field">
      <Col span="5">
        <p>链接名称</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.title" placeholder="请输入链接名称"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>链接地址</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.url" placeholder="请输入链接地址"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>链接顺序</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.order" placeholder="请输入链接顺序"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>链接图标</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.icon" placeholder="请输入链接图标"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>链接简介</p>
      </Col>
      <Col span="19">
        <textarea v-model="infors.description" placeholder="请输入链接简介"></textarea>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>打分评级</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.grade" placeholder="请输入1-10的数字"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>是否显示</p>
      </Col>
      <Col span="19">
        <i-switch v-model="infors.status" size="large">
          <span slot="open">显示</span>
          <span slot="close">隐藏</span>
        </i-switch>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>打开方式</p>
      </Col>
      <Col span="19">
        <RadioGroup v-model="infors.actiontype" type="button">
            <Radio label="_self">当前窗口</Radio>
            <Radio label="_blank">新窗口</Radio>
        </RadioGroup>
      </Col>
    </Row>
  </Modal>
</template>
<script>
import { addOrUpdateLink } from '@/api/getdatas'
export default {
  data () {
    return {
      name: 'addlink',
      switch1: false,
      isshow: false,
      infors: {
        id: '',
        title: '',
        url: '',
        order: '',
        icon: '',
        actiontype: '_blank',
        grade: 1,
        status: true,
        description: ''
      }
    }
  },
  methods: {
    changestatus () {
      this.isshow = !this.isshow
    },
    submitdata () {
      addOrUpdateLink(this.infors).then(res => {
        this.$emit('success')
        console.log('添加链接成功', res)
      })
    },
    setdatas (data) {
      this.infors.description = data.description
      this.infors.title = data.name
      this.infors.url = data.url
      this.infors.order = data.list_order
      this.infors.icon = data.image
      this.infors.actiontype = data.target
      this.infors.grade = data.rating
      this.infors.status = Boolean(data.status)
      this.infors.id = data.id
    }
  }
}
</script>
<style lang="less">
.addlink{
  .field{
    margin: 10px 0;
    p{
      text-align: right;
      line-height: 32px;
      padding-right: 15px;
    }
    textarea{
      resize: none;
      width: 100%;
    }
  }
}
</style>
