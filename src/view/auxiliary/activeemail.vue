<template>
  <div>
    <p>{{ message }}</p>
  </div>
</template>
<script>
import { activeEmail } from '@/api/getdatas'
export default {
  data () {
    return {
      message: '邮箱激活中。。。'
    }
  },
  beforeMount () {
    let { id, code } = this.$route.params
    activeEmail({
      id,
      code
    }).then(res => {
      console.log('邮箱激活成功', res)
      this.message = '邮箱激活成功'
    })
  }
}
</script>
