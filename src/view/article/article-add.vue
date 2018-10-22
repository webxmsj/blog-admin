<template>
  <Tabs class="addarticle" value="markeditor" @on-click="tabChange">
    <TabPane label="MarkDown编辑器" name="markeditor">
      <div class="chosecategory">
        <Dropdown @on-click="categoryResult">
          <a href="javascript:void(0)">
            分类选择
            <Icon type="ios-arrow-down"></Icon>
          </a>
          <DropdownMenu slot="list">
            <dropChild :menudata="categorys"></dropChild>
          </DropdownMenu>
        </Dropdown>
        <span class="categoryres">选择结果：{{ displaycategory }}</span>
      </div>
      <div class="formbox">
        <Row>
          <Col span="6">
            <Row>
              <Col span="5">
                <p style="line-height: 32px;margin-right: 10px;">文章标题：</p>
              </Col>
              <Col span="19">
                <Input v-model="articledatas.title" style="width:auto;"></Input>
              </Col>
            </Row>
          </Col>
          <Col span="18">
            <Row>
              <Col span="2">
                <p style="line-height: 32px;margin-right: 10px;">文章关键字：</p>
              </Col>
              <Col span="19">
                <Input v-model="articledatas.keywords" style="width:auto;"></Input>
              </Col>
            </Row>
          </Col>
        </Row>

        <Row>
          <Col span="6">
            <Row>
              <Col span="5">
                <p style="line-height: 32px;margin-right: 10px;">文章标签：</p>
              </Col>
              <Col span="19">
                <Select v-model="articledatas.tags" multiple style="width:260px">
                  <Option v-for="(item, index) in tags" :value="item.id" :key="index">{{ item.name }}</Option>
                </Select>
              </Col>
            </Row>
          </Col>
          <Col span="18">
            <Row>
              <Col span="2">
                <p style="line-height: 32px;margin-right: 10px;">文章转载来源：</p>
              </Col>
              <Col span="19">
                <Input v-model="articledatas.sourceurl" style="width:auto;"></Input>
              </Col>
            </Row>
          </Col>
        </Row>
        <Row>
          <Col span="5">
            <Row>
              <Col span="6">
                <p style="line-height: 32px;margin-right: 10px;">允许评论：</p>
              </Col>
              <Col span="17">
                <i-switch v-model="articledatas.enableComment" size="large">
                  <span slot="open">是</span>
                  <span slot="close">否</span>
                </i-switch>
              </Col>
            </Row>
          </Col>
          <Col span="5">
            <Row>
              <Col span="6">
                <p style="line-height: 32px;margin-right: 10px;">是否置顶：</p>
              </Col>
              <Col span="17">
                <i-switch v-model="articledatas.toTop" size="large">
                  <span slot="open">是</span>
                  <span slot="close">否</span>
                </i-switch>
              </Col>
            </Row>
          </Col>
          <Col span="5">
            <Row>
              <Col span="6">
                <p style="line-height: 32px;margin-right: 10px;">是否推荐：</p>
              </Col>
              <Col span="17">
                <i-switch v-model="articledatas.recommended" size="large">
                  <span slot="open">是</span>
                  <span slot="close">否</span>
                </i-switch>
              </Col>
            </Row>
          </Col>
        </Row>
        <Row>
          <Col span="2">
            <p style="line-height: 100px;">文章缩略图：</p>
          </Col>
          <Col span="22">
            <div class="articlethumb">
              <Upload
                :show-upload-list="false"
                :format="['jpg','jpeg','png']"
                :max-size="2048"
                :before-upload="uploadThumb"
                :on-format-error="pc1FormatError"
                multiple
                type="drag"
                action="">
                <div style="width: 100px;height:100px;line-height:100px;text-align: center;">
                    <p>点击上传图片</p>
                </div>
              </Upload>
              <div class="mask" v-if="articledatas.thumb" :style="{backgroundImage: 'url('+ articledatas.thumb +')'}">
                <p><span>重新上传</span></p>
              </div>
            </div>
          </Col>
        </Row>
      </div>

      <p class="information">文章摘要：</p>
      <textarea v-model="articledatas.abstracthtml" cols="70" rows="5" style="resize: none;"></textarea>
      <!-- <MarkEditor @on-blur="setabstracehtml" :options="abstractOptions"></MarkEditor> -->
      <p class="information">文章内容：</p>
      <MarkEditor @on-blur="setContentHtml" :options="contentOptions"></MarkEditor>
      <ButtonGroup>
        <Button type="primary" :loading="pushstatus_md" icon="ios-power" @click="pushArticle(0)">
          <span v-if="!pushstatus_md">发布</span>
          <span v-else>提交中……</span>
        </Button>
        <Button>存为草稿</Button>
      </ButtonGroup>
    </TabPane>
    <TabPane label="富文本编辑器" name="richeditor">
      <RichText></RichText>
      <Button type="primary" :loading="pushstatus_rich" icon="ios-power" @click="pushArticle(1)">
        <span v-if="!pushstatus_rich">发布</span>
        <span v-else>发布中……</span>
      </Button>
    </TabPane>
  </Tabs>
</template>

<script>
import MarkEditor from '@/components/markdown/markdown.vue'
import RichText from '@/components/editor/editor.vue'
import { queryall, uploadFile, addOrUpdateArticle } from '@/api/getdatas'
import { transformorigincategorys } from '@/libs/util'
import dropChild from './dropChild.vue'
export default {
  data () {
    return {
      pushstatus_md: false,
      pushstatus_rich: false,
      abstractOptions: {
        toolbar: false,
        spellChecker: false
      },
      contentOptions: {
        spellChecker: false
      },
      articledatas: {
        id: '',
        userId: '',
        html: '',
        category: '',
        title: '',
        keywords: '',
        thumb: '',
        sourceurl: '',
        abstracthtml: '',
        tags: [],
        enableComment: true,
        toTop: false,
        recommended: false,
        status: true,
        format: 'md' // 文章格式
      },
      displaycategory: '',
      tags: [],
      categorys: []
    }
  },
  components: {
    MarkEditor,
    RichText,
    dropChild
  },
  beforeMount () {
    this.articledatas.userId = this.$store.state.user.userId
    queryall('blog_category').then(res => {
      if (res.status === 200) {
        this.categorys = transformorigincategorys(res.data)
      } else {
        console.log('请求失败')
      }
    })
    //  获取标签
    queryall('blog_tag').then(res => {
      if (res.status === 200) {
        this.tags = res.data
      } else {
        console.log('请求失败')
      }
    })
  },
  methods: {
    uploadThumb (file) {
      var that = this
      var reader = new FileReader()
      let formData = new FormData()
      reader.onload = function (e) {
        var img = new Image()
        img.src = e.target.result
        img.onload = function () {
          formData.append('file', file)
          uploadFile(formData).then(res => {
            that.articledatas.thumb = 'http://img.bfrontend.com/' + res.data
            console.log('上传成功', res.data)
          })
        }
      }
      reader.readAsDataURL(file)
    },
    pc1FormatError (file) {
      console.log('文件格式不正确', file.name)
    },
    pushArticle (arg) {
      if (arg) {
        this.pushstatus_rich = true
      } else {
        this.pushstatus_md = true
      }
      addOrUpdateArticle(this.articledatas).then(res => {
        console.log('添加文章成功', res)
        this.pushstatus_md = false
      })
    },
    setContentHtml (value) {
      this.articledatas.html = value
    },
    setabstracehtml (value) {
      this.articledatas.abstracthtml = value
    },
    tabChange (name) {
      console.log('你点击了' + name)
    },
    categoryResult (data) {
      let { id, name } = JSON.parse(data)
      this.displaycategory = name
      this.articledatas.category = id
    }
  }
}
</script>

<style lang="less">
.addarticle{
  padding-bottom: 20px;
  .chosecategory{
    margin-bottom: 15px;
    padding-left: 15px;
    p{
      margin-bottom: 6px;
    }
    .categoryres{
      margin-left: 15px;
    }
  }
  .formbox{
    margin-bottom: 15px;
    .ivu-row{
      margin-bottom: 6px;
    }
    .articlethumb{
      width: 100px;
      height: 100px;
      text-align: center;
      position: relative;
      p{
        text-align: center;
        line-height: 100px;
      }
      .mask{
        background-size: cover;
        background-position: center;
        position:absolute;
        left:0;
        top:0;
        height:100%;
        width: 100%;
        z-index: 2;
        p{
          display: block;
          transition: all .6s linear;
          opacity: 0;
          color: #fff;
          text-align: center;
          line-height: 100px;
          height: 100px;
          span{
            cursor: pointer;
            padding: 5px 0;
            margin: 0 10px;
          }
        }
        &:hover{
          p{
            opacity: 1;
            background: rgba(0,0,0,.5);
          }
        }
      }
    }
  }
  .information{
    margin-bottom: 15px;
  }
}
</style>
