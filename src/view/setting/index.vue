<template>
  <Tabs type="card" :value="tabname" @on-click="tabchange">
    <TabPane label="信息配置" name="info">
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
    <TabPane label="皮肤" name="theme">皮肤</TabPane>
    <TabPane label="参数设置" name="field">参数设置</TabPane>
    <TabPane label="七牛" name="qiniu">
      <div class="box">
        <div class="item">
          <label for="title">Access Key：</label>
          <Input id="title" placeholder="请输入Access Key" v-model="qiniu.data.accessKey" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">Secret Key：</label>
          <Input id="title" placeholder="请输入Secret Key" v-model="qiniu.data.secretKey" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">域名：</label>
          <Input id="title" placeholder="请输入域名" v-model="qiniu.data.domain" style="width: 300px"/>
        </div>
        <div class="item">
          <label for="title">Bucket：</label>
          <Input id="title" placeholder="请输入Bucket" v-model="qiniu.data.bucket" style="width: 300px"/>
        </div>
      </div>
      <Button type="primary" @click="savedata('qiniu')">更新</Button>
    </TabPane>
    <TabPane label="邮箱配置" name="email">邮箱配置</TabPane>
    </Tabs>
</template>
<script>
import { updateSetting, getSettingByType } from '@/api/getdatas'

export default {
  data () {
    return {
      name: '设置中心',
      tabname: '',
      qiniu: {
        id: '',
        type: 'qiniu',
        data: {
          accessKey: '',
          secretKey: '',
          domain: '',
          bucket: ''
        }
      }
    }
  },
  methods: {
    savedata (type) {
      updateSetting({
        id: this[type]['id'],
        type: type,
        data: JSON.stringify(this[type]['data'])
      }).then(res => {
        if (res.data['id']) {
          this[type]['id'] = res.data['id']
        }
        console.log('更新设置成功', type, res)
      })
    },
    tabchange (name) {
      getSettingByType(name).then(res => {
        console.log('查询设置成功', name, res)
        if (res.data.length > 0) {
          this[name] = {
            id: res.data[0]['id'],
            data: JSON.parse(res.data[0]['data']),
            type: res.data[0]['type']
          }
        }
      })
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
