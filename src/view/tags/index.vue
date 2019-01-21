<template>
  <div>
    <ButtonGroup>
      <Button type="success" @click="showaddtag">添加标签</Button>
    </ButtonGroup>
    <AddTag ref="addtag" @success="reload"></AddTag>
    <Table class="tag_table" stripe :columns="columns" :data="datas"></Table>
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
    this.handleQueryAll()
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
    handleQueryAll () {
      queryall('blog_tag').then(res => {
        if (res.status === 200) {
          this.datas = res.data
        } else {
          console.log('表格数据加载失败')
        }
      })
    },
    reload () {
      this.handleQueryAll()
    },
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
.tag_table{
  border: none;
  .ivu-table{
    display: inline-block;
    border: 1px solid #dcdee2;
  }
  & > div {
    &:before{
      display: none;
    }
    &:after{
      display: none;
    }
  }
}
</style>
