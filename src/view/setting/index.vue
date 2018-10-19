<template>
  <Tabs type="card" :value="tabname" @on-click="tabchange">
    <TabPane label="信息配置" name="info">
      <div class="box">
        <Row class="item">
          <Col span="2">
            <p>博客标题：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入博客标题" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>博客子标题：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入博客子标题" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>博客地址：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入博客地址" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>关键字：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入关键字" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>描述：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入博客描述" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>HTML head：</p>
          </Col>
          <Col span="22">
            <Input placeholder="头部脚本" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>公告：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入公告" style="width: auto">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>页脚：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入页脚脚本" style="width: auto">
            </Input>
          </Col>
        </Row>
      </div>
    </TabPane>
    <TabPane label="皮肤" name="theme">皮肤</TabPane>
    <TabPane label="参数设置" name="field">参数设置</TabPane>
    <TabPane label="七牛" name="qiniu">
      <div class="box">
        <Row class="item">
          <Col span="2">
            <p>Access Key：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入Access Key" style="width: auto" v-model="qiniu.data.accessKey">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>Secret Key：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入Secret Key" style="width: auto" v-model="qiniu.data.secretKey">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>域名：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入域名" style="width: auto" v-model="qiniu.data.domain">
            </Input>
          </Col>
        </Row>
        <Row class="item">
          <Col span="2">
            <p>Bucket：</p>
          </Col>
          <Col span="22">
            <Input placeholder="请输入Bucket" style="width: auto" v-model="qiniu.data.bucket">
            </Input>
          </Col>
        </Row>
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
    .item{
      margin: 10px 0;
      p{
        text-align: right;
        line-height: 32px;
      }
    }
  }
}
</style>
