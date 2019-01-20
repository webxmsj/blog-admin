<template>
  <div>
    <Row class="expand-row">
      <Col span="1">
        <span>id: </span>
        <span>{{ row.id }}</span>
      </Col>
      <Col span="1">
        <span>标签: </span>
        <Tag color="primary" v-for="(tag,index) in tagsarr" :key="index">{{ tag }}</Tag>
      </Col>
      <Col span="2">
        <span>标题: </span>
        <span>{{ row.post_title }}</span>
      </Col>
      <Col span="1">
        <span>创建时间: </span>
        <span>{{ row.create_time }}</span>
      </Col>
      <Col span="1">
        <span>更新时间: </span>
        <span>{{ row.update_time }}</span>
      </Col>
      <Col span="1">
        <span>删除时间: </span>
        <span>{{ row.delete_time }}</span>
      </Col>
      <Col span="1">
        <span>发布时间: </span>
        <span>{{ row.published_time }}</span>
      </Col>
    </Row>
    <Row>
      <Col span="1">
        <span>父级id: </span>
        <span>《{{ row.parent_id }}》</span>
      </Col>
      <Col span="1">
        <span>文章类型: </span>
        <span>{{ row.post_format }}</span>
      </Col>
      <Col span="1">
        <span>发表者id: </span>
        <span>{{ row.user_id }}</span>
      </Col>
    </Row>
  </div>
</template>
<script>
export default {
  data () {
    return {
      tagsarr: []
    }
  },
  props: {
    row: Object
  },
  mounted () {
    var tag = this.row.tag
    if (tag && tag.indexOf(',') > -1) {
      this.tagsarr = tag.split(',')
    }
  }
}
</script>
<style scoped>
.expand-row {
  margin-bottom: 16px;
}
</style>
