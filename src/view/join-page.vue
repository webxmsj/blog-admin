<template>
  <div>
    <Row :gutter="20">
      <i-col span="8">
        <Card title="个人QQ" shadow>
          <img class="qq-group-img" :src="qqFans" alt="">
          <p class="qq-group-intro">本群为使用iview-admin或者对iview-admin感兴趣的开发者提供交流平台，在这里，解决你开发中的疑惑，共同进步。</p>
        </Card>
      </i-col>

      <i-col span="8">
        <Card title="个人微信" shadow>
          <img class="qq-group-img" :src="qqFans" alt="">
          <p class="qq-group-intro">本群为使用iview-admin或者对iview-admin感兴趣的开发者提供交流平台，在这里，解决你开发中的疑惑，共同进步。</p>
        </Card>
      </i-col>

      <i-col span="8">
        <Card title="支付宝收款码" shadow>
          <img class="qq-group-img" :src="qqFans" alt="">
          <p class="qq-group-intro">本群为使用iview-admin或者对iview-admin感兴趣的开发者提供交流平台，在这里，解决你开发中的疑惑，共同进步。</p>
        </Card>
      </i-col>

      <i-col span="8">
        <Card title="微信收款码" shadow>
          <img class="qq-group-img" :src="qqFans" alt="">
          <p class="qq-group-intro">本群为使用iview-admin或者对iview-admin感兴趣的开发者提供交流平台，在这里，解决你开发中的疑惑，共同进步。</p>
        </Card>
      </i-col>
    </Row>
  </div>
</template>

<script>
import qqFans from '@/assets/images/qq-fance.jpg'
export default {
  name: 'join_page',
  data () {
    return {
      qqFans
    }
  }
}
</script>

<style>
.qq-group-img{
  display: block;
  margin: 0 auto;
  width: 240px;
}
.qq-group-intro{
  padding: 20px;
  font-size: 16px;
}
</style>
