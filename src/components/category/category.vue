<template>
  <div v-if="datas">
    <Collapse v-for="(item, index) in datas" :key="index">
      <Panel :name="item.name">
        <span>{{ item.name }}</span>
        <div class="btngroup">
          <Button size="small" icon="md-add" @click="additem($event, item)"></Button>
          <Button size="small" icon="md-close" @click="delitem($event, item)"></Button>
        </div>
        <p slot="content">{{ item.description }}</p>
      </Panel>
      <category-item v-if="item.children" :datas="item.children"></category-item>
    </Collapse>
  </div>
</template>
<script>
import Bus from '@/components/category/bus'
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
      Bus.$emit('additem', item.classline)
    },
    delitem (event, item) {
      event.stopPropagation()
      Bus.$emit('delitem', item.classline)
    }
  }
}
</script>
