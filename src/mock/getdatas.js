import { getParams } from '@/libs/util'
export const getFriendLinks = () => {
  return [{
    id: 1,
    status: 1,
    rating: 1,
    list_order: 8,
    description: 'thinkcmf官网',
    url: 'http://www.thinkcmf.com',
    name: 'THINKCMF',
    image: '',
    target: '_blank',
    rel: ''
  }, {
    id: 1,
    status: 1,
    rating: 1,
    list_order: 2,
    description: '百度官网',
    url: 'http://www.baidu.com',
    name: 'baidu',
    image: '',
    target: '_blank',
    rel: ''
  }]
}

export const queryAll = (req) => {
  const params = getParams(req.url)
  console.log(params)
  var result = []
  switch (params.tablename) {
    case 'blog_link':
      result = [{
        id: 0,
        status: 1,
        rating: 8,
        list_order: 6,
        description: '信息描述',
        url: 'http://www.baidu.com',
        name: '百度',
        image: '',
        target: '_blank',
        rel: ''
      }]
      break
    case 'blog_category':
      result = [{
        id: 0
      }]
      break
  }
  return result
}

export const getDisplayStructure = req => {
  const params = getParams(req.url)
  var result
  switch (params.tablename) {
    case 'blog_link':
      result = [{
        COLUMN_COMMENT: '编号',
        COLUMN_NAME: 'id'
      }, {
        COLUMN_COMMENT: '状态',
        COLUMN_NAME: 'status' // 1 显示 0 不显示
      }, {
        COLUMN_COMMENT: '级别',
        COLUMN_NAME: 'rating'
      }, {
        COLUMN_COMMENT: '排序',
        COLUMN_NAME: 'list_order'
      }, {
        COLUMN_COMMENT: '描述',
        COLUMN_NAME: 'description'
      }, {
        COLUMN_COMMENT: '地址',
        COLUMN_NAME: 'url'
      }, {
        COLUMN_COMMENT: '名称',
        COLUMN_NAME: 'name'
      }, {
        COLUMN_COMMENT: '图标',
        COLUMN_NAME: 'image'
      }, {
        COLUMN_COMMENT: '打开方式',
        COLUMN_NAME: 'target'
      }, {
        COLUMN_COMMENT: '链接与网站的关系',
        COLUMN_NAME: 'rel'
      }]
      break
    case 'blog_category':
      result = [{
        COLUMN_COMMENT: '分类id',
        COLUMN_NAME: 'id'
      }, {
        COLUMN_COMMENT: '分类父id',
        COLUMN_NAME: 'parent_id'
      }, {
        COLUMN_COMMENT: '分类文章数',
        COLUMN_NAME: 'post_count'
      }, {
        COLUMN_COMMENT: '状态',
        COLUMN_NAME: 'status'
      }, {
        COLUMN_COMMENT: '删除时间',
        COLUMN_NAME: 'delete_time'
      }, {
        COLUMN_COMMENT: '排序',
        COLUMN_NAME: 'list_order'
      }, {
        COLUMN_COMMENT: '分类名称',
        COLUMN_NAME: 'name'
      }, {
        COLUMN_COMMENT: '分类描述',
        COLUMN_NAME: 'description'
      }, {
        COLUMN_COMMENT: '关系路径',
        COLUMN_NAME: 'path'
      }, {
        COLUMN_COMMENT: 'seo标题',
        COLUMN_NAME: 'seo_title'
      }, {
        COLUMN_COMMENT: 'seo描述',
        COLUMN_NAME: 'seo_description'
      }, {
        COLUMN_COMMENT: 'seo关键词',
        COLUMN_NAME: 'seo_keywords'
      }, {
        COLUMN_COMMENT: '扩展属性',
        COLUMN_NAME: 'more'
      }]
      break
    case 'blog_category_post':
      result = [{
        COLUMN_COMMENT: 'id',
        COLUMN_NAME: 'id'
      }, {
        COLUMN_COMMENT: '文章id',
        COLUMN_NAME: 'post_id'
      }, {
        COLUMN_COMMENT: '分类id',
        COLUMN_NAME: 'category_id'
      }, {
        COLUMN_COMMENT: '排序',
        COLUMN_NAME: 'list_order'
      }, {
        COLUMN_COMMENT: '状态0发布1不发布',
        COLUMN_NAME: 'status'
      }]
      break
    case 'blog_tag':
      result = [{
        COLUMN_COMMENT: 'id',
        COLUMN_NAME: 'id'
      }, {
        COLUMN_COMMENT: '是否推荐',
        COLUMN_NAME: 'recommended'
      }, {
        COLUMN_COMMENT: '标签文章数量',
        COLUMN_NAME: 'post_count'
      }, {
        COLUMN_COMMENT: '标签名称',
        COLUMN_NAME: 'name'
      }, {
        COLUMN_COMMENT: '状态0发布1不发布',
        COLUMN_NAME: 'status'
      }]
      break
    case 'blog_tag_post':
      result = [{
        COLUMN_COMMENT: 'id',
        COLUMN_NAME: 'id'
      }, {
        COLUMN_COMMENT: '标签id',
        COLUMN_NAME: 'tag_id'
      }, {
        COLUMN_COMMENT: '文章id',
        COLUMN_NAME: 'post_id'
      }, {
        COLUMN_COMMENT: '状态0发布1不发布',
        COLUMN_NAME: 'status'
      }]
      break
  }
  return result
}
// 获取转换后的 分类数据
export const getCategorys = req => {
  return [{
    name: '文化',
    description: '文人墨客的世界',
    key: 'culture',
    classline: '0',
    children: [{
      name: '历史',
      description: '中华上下五千年的历史',
      key: 'history',
      classline: '0,0'
    }, {
      name: '哲学',
      description: '哲学者的世界我们不懂',
      key: 'philosophy',
      classline: '0,1'
    }]
  }, {
    name: '生活',
    description: '品味生活,享受生活',
    key: 'life',
    classline: '1',
    children: [{
      name: '旅行',
      description: '身体和灵魂总有一个在路上',
      key: 'travel',
      classline: '1,0',
      children: [{
        name: '在路上',
        description: '走出去,你将看到这个精彩的世界',
        key: 'category2-1',
        classline: '1,0,0'
      }, {
        name: '自助游',
        description: '带着自己的爱车,说走就走，说停就停',
        key: 'category2-2',
        classline: '1,0,1',
        children: [{
          name: '朋友',
          description: '朋友一生一起走',
          key: 'category2-1',
          classline: '1,0,1,0'
        }, {
          name: '同事',
          description: '相互帮助,相互鼓励,是同事情',
          key: 'category2-2',
          classline: '1,0,1,1',
          children: [{
            name: '同事一',
            description: '同事一',
            key: 'category',
            classline: '1,0,1,0,0'
          }]
        }, {
          name: '父母',
          description: '父母在哪,家在哪,那是我永远的避风港湾',
          key: 'category2-2',
          classline: '1,0,1,2'
        }]
      }]
    }, {
      name: '励志',
      description: '偶尔还是要喝一些鸡汤的,万一实现了呢',
      key: 'category2-2',
      classline: '1,1'
    }]
  }]
}
// 获取原始的 分类数据
export const getOriginalCategorys = req => {
  return [{
    id: 0,
    parent_id: null,
    post_count: 2,
    status: '1|0',
    delete_time: '2018-09-30',
    list_order: 0,
    name: '文化',
    description: '文人墨客的世界',
    path: '0',
    seo_title: '文化',
    seo_keywords: '文化',
    seo_description: '文人墨客的世界',
    more: '' // json
  }, {
    id: 1,
    parent_id: null,
    post_count: 2,
    status: '1|0',
    delete_time: '2018-09-30',
    list_order: 0,
    name: '生活',
    description: '品味生活,享受生活',
    path: '1',
    seo_title: '生活',
    seo_keywords: '生活',
    seo_description: '品味生活,享受生活',
    more: '' // json
  }, {
    id: 2,
    parent_id: 0,
    post_count: 2,
    status: '1|0',
    delete_time: '2018-09-30',
    list_order: 0,
    name: '历史',
    description: '中华上下五千年的历史',
    path: '0,0',
    seo_title: '历史',
    seo_keywords: '历史',
    seo_description: '中华上下五千年的历史',
    more: '' // json
  }]
}
