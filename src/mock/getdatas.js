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

export const getDisplayStructure = req => {
  const params = getParams(req.url)
  var result
  switch (params.tablename) {
    case 'blog_link':
      result = [{
        title: '编号',
        key: 'id'
      }, {
        title: '状态',
        key: 'status' // 1 显示 0 不显示
      }, {
        title: '级别',
        key: 'rating'
      }, {
        title: '排序',
        key: 'list_order'
      }, {
        title: '描述',
        key: 'description'
      }, {
        title: '地址',
        key: 'url'
      }, {
        title: '名称',
        key: 'name'
      }, {
        title: '图标',
        key: 'image'
      }, {
        title: '打开方式',
        key: 'target'
      }, {
        title: '链接与网站的关系',
        key: 'rel'
      }]
      break
    case 'blog_category':
      result = [{
        title: '分类id',
        key: 'id'
      }, {
        title: '分类父id',
        key: 'parent_id'
      }, {
        title: '分类文章数',
        key: 'post_count'
      }, {
        title: '状态',
        key: 'status'
      }, {
        title: '删除时间',
        key: 'delete_time'
      }, {
        title: '排序',
        key: 'list_order'
      }, {
        title: '分类名称',
        key: 'name'
      }, {
        title: '分类描述',
        key: 'description'
      }, {
        title: '关系路径',
        key: 'path'
      }, {
        title: 'seo标题',
        key: 'seo_title'
      }, {
        title: 'seo描述',
        key: 'seo_description'
      }, {
        title: 'seo关键词',
        key: 'seo_keywords'
      }, {
        title: '扩展属性',
        key: 'more'
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
