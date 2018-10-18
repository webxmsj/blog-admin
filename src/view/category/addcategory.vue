<template>
  <Modal class="addcategory" v-model="isshow" title="添加分类" @on-ok="savedata">
    <Row class="field">
      <Col span="5">
        <p>类别名称</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.name" placeholder="请输入类别名称"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>类别描述</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.description" placeholder="请输入类别描述"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>seo标题</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.seo_title" placeholder="请输入seo 标题"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>seo关键字</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.seo_keywords" placeholder="请输入seo 关键字"></Input>
      </Col>
    </Row>
    <Row class="field">
      <Col span="5">
        <p>seo描述</p>
      </Col>
      <Col span="19">
        <Input v-model="infors.seo_description" placeholder="请输入seo 描述"></Input>
      </Col>
    </Row>
  </Modal>
</template>
<script>
export default {
  data () {
    return {
      isshow: false,
      infors: {
        name: '',
        description: '',
        seo_title: '',
        seo_keywords: '',
        seo_description: '',
        id: ''
      },
      flag: ''
    }
  },
  methods: {
    changeStatus (flag) {
      this.isshow = !this.isshow
      this.flag = flag
    },
    savedata () {
      this.$emit('confirm', this.flag, this.infors)
    }
  }
}
</script>
<style lang="less">
.addcategory {
  .field{
    margin: 10px 0;
  }
}
</style>
