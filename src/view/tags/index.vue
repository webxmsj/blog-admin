<template>
  <div>
    <ButtonGroup>
      <Button type="success" @click="showaddtag">添加标签</Button>
    </ButtonGroup>
    <AddTag ref="addtag"></AddTag>
    <Table stripe :columns="columns" :data="datas"></Table>
  </div>
</template>
<script>
import { queryall, getDisplayStructure } from '@/api/getdatas'
import { convertSqlResToCol } from '@/libs/util'
import AddTag from './addtag.vue'
export default {
  components: {
    AddTag
  },
  data () {
    return {
      columns: [],
      datas: []
    }
  },
  beforeMount () {
    queryall('blog_tag').then(res => {
      if (res.status === 200) {
        this.datas = res.data
      } else {
        console.log('表格数据加载失败')
      }
    })

    // 获取表结构
    getDisplayStructure('blog_tag').then(res => {
      if (res.status === 200) {
        this.columns = convertSqlResToCol(res.data)
      } else {
        console.log(res)
      }
    })
  },
  methods: {
    showaddtag () {
      this.$refs.addtag.changestatus()
    }
  }
}
</script>
<style lang="less">
.ivu-btn-group{
  margin-bottom: 20px;
}
</style>
