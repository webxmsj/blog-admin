<template>
  <div class="upload_album">
    <div class="demo-upload-list" v-for="(item, index) in uploadList" :key="index">
      <template v-if="item.status === 'finished'">
        <img :src="item.url">
        <div class="demo-upload-list-cover">
          <Icon type="ios-eye-outline" @click.native="handleView(item.name)"></Icon>
          <Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
        </div>
      </template>
      <template v-else>
        <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
      </template>
    </div>
    <Upload
      ref="upload"
      :show-upload-list="false"
      :default-file-list="defaultList"
      :on-success="handleSuccess"
      :format="['jpg','jpeg','png']"
      :max-size="2048"
      :on-format-error="handleFormatError"
      :on-exceeded-size="handleMaxSize"
      :before-upload="handleBeforeUpload"
      multiple
      type="drag"
      action="//jsonplaceholder.typicode.com/posts/"
      style="display: inline-block;width:58px;">
      <div style="width: 58px;height:58px;line-height: 58px;">
        <Icon type="ios-camera" size="20"></Icon>
      </div>
    </Upload>
    <Modal title="预览大图" v-model="visible">
      <img :src="'http://img.bfrontend.com/' + imgName" v-if="visible" style="width: 100%">
    </Modal>
  </div>
</template>

<script>
import { uploadFile } from '@/api/getdatas'
export default {
  data () {
    return {
      defaultList: [
        {
          'name': '12053349.jpg',
          'url': 'http://img.bfrontend.com/12053349.jpg'
        },
        {
          'name': 'IMG_0866.JPG',
          'url': 'http://img.bfrontend.com/IMG_0866.JPG'
        }
      ],
      imgName: '',
      visible: false,
      uploadList: []
    }
  },
  methods: {
    handleView (name) {
      this.imgName = name
      this.visible = true
    },
    handleRemove (file) {
      const fileList = this.$refs.upload.fileList
      this.$refs.upload.fileList.splice(fileList.indexOf(file), 1)
    },
    handleSuccess (res, file) {
      file.url = 'http://img.bfrontend.com/' + file.name
      file.name = file.name
    },
    handleFormatError (file) {
      this.$Notice.warning({
        title: '上传文件类型错误',
        desc: '文件类型' + file.name + '是不被允许的，请使用正确的文件类型'
      })
    },
    handleMaxSize (file) {
      this.$Notice.warning({
        title: '上传文件超出最大限制',
        desc: '文件' + file.name + '大小太大,请不要超过2M'
      })
    },
    handleBeforeUpload (file) {
      // 执行上传 文件 => qiniuyun
      var reader = new FileReader()
      let formData = new FormData()
      reader.onload = function (e) {
        var img = new Image()
        img.src = e.target.result
        img.onload = function () {
          formData.append('file', file)
          uploadFile(formData)
        }
      }
      reader.readAsDataURL(file)
    }
  },
  mounted () {
    this.uploadList = this.$refs.upload.fileList
  }
}
</script>

<style lang="less">
.upload_album {
  .demo-upload-list{
    display: inline-block;
    width: 60px;
    height: 60px;
    text-align: center;
    line-height: 60px;
    border: 1px solid transparent;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
    position: relative;
    box-shadow: 0 1px 1px rgba(0,0,0,.2);
    margin-right: 4px;
  }
  .demo-upload-list img{
    width: 100%;
    height: 100%;
  }
  .demo-upload-list-cover{
    display: none;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: rgba(0,0,0,.6);
  }
  .demo-upload-list:hover .demo-upload-list-cover{
    display: block;
  }
  .demo-upload-list-cover i{
    color: #fff;
    font-size: 20px;
    cursor: pointer;
    margin: 0 2px;
  }
}
</style>
