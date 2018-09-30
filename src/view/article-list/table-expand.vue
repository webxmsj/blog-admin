<template>
  <div>
    <Row class="expand-row">
      <Col span="8">
        <span>标签: </span>
        <Tag color="primary" v-for="(tag,index) in tagsarr" :key="index">{{ tag }}</Tag>
      </Col>
      <Col span="8">
        <span>Interest: </span>
        <span>{{ row.interest }}</span>
      </Col>
      <Col span="8">
        <span>Birthday: </span>
        <span>{{ row.birthday }}</span>
      </Col>
    </Row>
    <Row>
      <Col span="8">
        <span>Favorite book: </span>
        <span>《{{ row.book }}》</span>
      </Col>
      <Col span="8">
        <span>Favorite movie: </span>
        <span>{{ row.movie }}</span>
      </Col>
      <Col span="8">
        <span>Favorite music: </span>
        <span>{{ row.music }}</span>
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
