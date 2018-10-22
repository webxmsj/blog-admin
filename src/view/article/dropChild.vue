<template>
  <div>
    <div v-for="(x, i) in menudata" :key="i">
      <div v-if="x.children && x.children.length>0">
        <Dropdown placement="right-start">
          <DropdownItem :name="JSON.stringify({id: x.id, name: x.name})">
            <span>{{x.name}}</span>
            <Icon type="ios-arrow-forward"></Icon>
          </DropdownItem>
          <DropdownMenu slot="list">
            <mi :menudata="x.children"></mi>
          </DropdownMenu>
        </Dropdown>
      </div>
      <div v-else>
        <DropdownItem :name="JSON.stringify({id: x.id, name: x.name})">
          <span>{{x.name}}</span>
        </DropdownItem>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'mi',
  props: ['menudata'],
  data: function () {
    return {}
  }
}
</script>
