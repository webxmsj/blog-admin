<template>
  <Modal class="addtag" v-model="isshow" title="添加标签" @on-ok="submitdata">
    <Row class="field">
      <Col span="5">
        <p>标签名称</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.name" placeholder="请输入标签名称"></Input>
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
        <p>是否推荐</p>
      </Col>
      <Col span="19">
        <i-switch v-model="infors.recommended" size="large">
          <span slot="open">推荐</span>
          <span slot="close">不推荐</span>
        </i-switch>
      </Col>
    </Row>
  </Modal>
</template>
<script>
import { addOrUpdateTag } from '@/api/getdatas'
export default {
  data () {
    return {
      isshow: false,
      infors: {
        id: '',
        name: '',
        status: true,
        recommended: false
      }
    }
  },
  methods: {
    changestatus () {
      this.isshow = !this.isshow
    },
    submitdata () {
      addOrUpdateTag(this.infors).then(res => {
        console.log('添加标签成功', res)
        this.$emit('success')
      })
    },
    setdatas (data) {
      console.log(data)
    }
  }
}
</script>
<style lang="less">
.addtag{
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
