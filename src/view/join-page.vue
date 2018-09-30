<template>
  <div>
    <Row :gutter="20">
      <i-col span="8">
        <Card title="个人QQ" shadow>
          <img class="qq-group-img" :src="qqqrcode" alt="">
          <p class="qq-group-intro">个人qq联系方式</p>
        </Card>
      </i-col>

      <i-col span="8">
        <Card title="个人微信" shadow>
          <img class="qq-group-img" :src="wechatqrcode" alt="">
          <p class="qq-group-intro">个人微信联系方式</p>
        </Card>
      </i-col>

      <i-col span="8">
        <Card title="支付宝收款码" shadow>
          <img class="qq-group-img" :src="qqqrcode" alt="">
          <p class="qq-group-intro">支付宝收款码，欢迎你的打赏</p>
        </Card>
      </i-col>

      <i-col span="8">
        <Card title="微信收款码" shadow>
          <img class="qq-group-img" :src="wechatqrcode" alt="">
          <p class="qq-group-intro">微信收款码，欢迎你的打赏</p>
        </Card>
      </i-col>
    </Row>
  </div>
</template>

<script>
import qqqrcode from '@/assets/images/qqqrcode.jpg'
import wechatqrcode from '@/assets/images/wechatqrcode.jpg'
export default {
  name: 'join_page',
  data () {
    return {
      qqqrcode,
      wechatqrcode
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
.ivu-col{
  padding: 10px;
}
</style>
