<template>
  <div v-if="datas">
    <Collapse accordion v-for="(item, index) in datas" :key="index">
      <Panel :name="item.name">
        <span>{{ item.name }}</span>
        <div class="btngroup">
          <Button size="small" icon="md-add" @click="additem($event, item)"></Button>
          <Button size="small" icon="md-create" @click="edititem($event, item)"></Button>
          <Button size="small" icon="md-close" @click="delitem($event, item)"></Button>
        </div>
        <p slot="content">{{ item.description }}</p>
      </Panel>
      <category-item v-if="item.children" :datas="item.children"></category-item>
    </Collapse>
  </div>
</template>
<script>
export default {
  name: 'categoryItem',
  data () {
    return {
      name: 'asd'
    }
  },
  props: {
    datas: {
      required: true,
      type: Array
    }
  },
  methods: {
    additem (event, item) {
      event.stopPropagation()
      this.$bus.$emit('additem', item.path)
    },
    delitem (event, item) {
      event.stopPropagation()
      this.$bus.$emit('delitem', item)
    },
    edititem (event, item) {
      event.stopPropagation()
      this.$bus.$emit('edititem', item)
    }
  }
}
</script>
<style lang="less">
.btngroup{
  .ivu-btn{
    margin: 0 2px;
  }
}
</style>
