<template>
  <Tabs type="card">
    <TabPane label="信息配置">
      <div class="box">
        <div class="item">
          <label for="title">博客标题：</label>
          <Input id="title" placeholder="请输入博客标题" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">博客子标题：</label>
          <Input id="title" placeholder="请输入博客子标题" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">博客地址：</label>
          <Input id="title" placeholder="请输入博客地址" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">关键字：</label>
          <Input id="title" placeholder="请输入关键字" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">描述：</label>
          <Input id="title" placeholder="请输入博客描述" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">HTML head：</label>
          <Input id="title" placeholder="头部脚本" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">公告：</label>
          <Input id="title" placeholder="请输入公告" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">页脚：</label>
          <Input id="title" placeholder="请输入页脚脚本" style="width: 300px"/>
        </div>
      </div>
    </TabPane>
    <TabPane label="皮肤">皮肤</TabPane>
    <TabPane label="参数设置">参数设置</TabPane>
    <TabPane label="七牛">七牛</TabPane>
    <TabPane label="邮箱配置">邮箱配置</TabPane>
    </Tabs>
</template>
<script>
export default {
  data () {
    return {
      name: '设置中心'
    }
  }
}
</script>
<style lang="less">
.ivu-tabs-content{
  background: #fff;
  .box{
    width: 80%;
    margin: auto;
    .item{
      margin: 10px 0;
    }
  }
}
</style>
