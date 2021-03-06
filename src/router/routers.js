import Main from '@/components/main'
import parentView from '@/components/parent-view'

/**
 * iview-admin中meta除了原生参数外可配置的参数:
 * meta: {
 *  hideInMenu: (false) 设为true后在左侧菜单不会显示该页面选项
 *  notCache: (false) 设为true后页面不会缓存
 *  access: (null) 可访问该页面的权限数组，当前路由设置的权限会影响子路由
 *  icon: (-) 该页面在左侧菜单、面包屑和标签导航处显示的图标，如果是自定义图标，需要在图标名称前加下划线'_'
 *  beforeCloseName: (-) 设置该字段，则在关闭当前tab页时会去'@/router/before-close.js'里寻找该字段名对应的方法，作为关闭前的钩子函数
 * }
 */

export default [
  {
    path: '/login',
    name: 'login',
    meta: {
      title: 'Login - 登录',
      hideInMenu: true
    },
    component: () => import('@/view/login/login.vue')
  },
  {
    path: '/',
    name: '_home',
    redirect: '/home',
    component: Main,
    meta: {
      hideInMenu: true,
      notCache: true
    },
    children: [
      {
        path: '/home',
        name: 'home',
        meta: {
          hideInMenu: true,
          // icon: 'md-home',
          title: '首页',
          notCache: true
        },
        component: () => import('@/view/single-page/home')
      }
    ]
  },
  {
    path: '/join',
    name: 'join',
    meta: {
      hideInMenu: true
    },
    component: Main,
    children: [
      {
        path: 'join_page',
        name: 'join_page',
        meta: {
          icon: '_qq',
          title: 'join_page'
        },
        component: () => import('@/view/join-page.vue')
      }
    ]
  },
  {
    path: '/articles',
    name: 'article',
    meta: {
      icon: 'ios-paper',
      title: '文章管理'
    },
    component: Main,
    children: [
      {
        path: 'article_list',
        name: 'article_list',
        meta: {
          icon: 'ios-paper',
          title: '文章列表'
        },
        component: () => import('@/view/article/article-lists.vue')
      },
      {
        path: 'article_draft',
        name: 'article_draft',
        meta: {
          icon: 'ios-paper-plane',
          title: '文章草稿箱'
        },
        component: () => import('@/view/article/article-draft.vue')
      },
      {
        path: 'article_add',
        name: 'article_add',
        meta: {
          icon: 'ios-paper-plane',
          title: '新建文章'
        },
        component: () => import('@/view/article/article-add.vue')
      },
    ]
  },
  {
    path: '/comment',
    name: 'comment',
    meta: {
      icon: 'md-outlet',
      title: '评论管理'
    },
    component: Main,
    children: [
      {
        path: 'comment_list',
        name: 'comment_list',
        meta: {
          icon: 'md-outlet',
          title: '评论列表'
        },
        component: () => import('@/view/comment/comment.vue')
      }
    ]
  },
  {
    path: '/category',
    name: 'category',
    meta: {
      icon: 'md-git-merge',
      title: '分类管理'
    },
    component: Main,
    children: [
      {
        path: 'category_index',
        name: 'category_index',
        meta: {
          icon: 'md-git-merge',
          title: '分类管理'
        },
        component: () => import('@/view/category/index.vue')
      }
    ]
  },
  {
    path: '/tags',
    name: 'tags',
    meta: {
      icon: 'md-pricetags',
      title: '标签管理'
    },
    component: Main,
    children: [
      {
        path: 'tags_index',
        name: 'tags_index',
        meta: {
          icon: 'md-pricetags',
          title: '标签管理',
          notCache: true
        },
        component: () => import('@/view/tags/index.vue')
      }
    ]
  },
  {
    path: '/links',
    name: 'links',
    meta: {
      icon: 'ios-body',
      title: '链接管理'
    },
    component: Main,
    children: [
      {
        path: 'links_index',
        name: 'links_index',
        meta: {
          icon: 'ios-body',
          title: '链接管理'
        },
        component: () => import('@/view/links/index.vue')
      }
    ]
  },
  {
    path: '/users',
    name: 'users',
    meta: {
      icon: 'ios-contact',
      title: '用户管理'
    },
    component: Main,
    children: [
      {
        path: 'users_index',
        name: 'users_index',
        meta: {
          icon: 'ios-contact',
          title: '用户管理'
        },
        component: () => import('@/view/users/index.vue')
      }
    ]
  },
  {
    path: '/setting',
    name: 'setting',
    meta: {
      icon: 'ios-settings',
      title: '偏好设置'
    },
    component: Main,
    children: [
      {
        path: 'setting_index',
        name: 'setting_index',
        meta: {
          icon: 'ios-settings',
          title: '设置中心'
        },
        component: () => import('@/view/setting/index.vue')
      }
    ]
  },
  {
    path: '/recycle',
    name: 'recycle',
    meta: {
      icon: 'ios-cube',
      title: '回收站'
    },
    component: Main,
    children: [
      {
        path: 'recycle_index',
        name: 'recycle_index',
        meta: {
          icon: 'ios-cube',
          title: '回收站'
        },
        component: () => import('@/view/recycle/index.vue')
      }
    ]
  },
  {
    path: '/components',
    name: 'components',
    meta: {
      hideInMenu: true,  // 隐藏起来
      icon: 'logo-buffer',
      title: '组件'
    },
    component: Main,
    children: [
      {
        path: 'count_to_page',
        name: 'count_to_page',
        meta: {
          icon: 'md-trending-up',
          title:  '数字渐变'
        },
        component: () => import('@/view/components/count-to/count-to.vue')
      },
      {
        path: 'drag_list_page',
        name: 'drag_list_page',
        meta: {
          icon: 'ios-infinite',
          title: '拖拽列表'
        },
        component: () => import('@/view/components/drag-list/drag-list.vue')
      },
      {
        path: 'tables_page',
        name: 'tables_page',
        meta: {
          icon: 'md-grid',
          title: '多功能表格'
        },
        component: () => import('@/view/components/tables/tables.vue')
      },
      {
        path: 'split_pane_page',
        name: 'split_pane_page',
        meta: {
          icon: 'md-pause',
          title: '分割窗口'
        },
        component: () => import('@/view/components/split-pane/split-pane.vue')
      },
      {
        path: 'markdown_page',
        name: 'markdown_page',
        meta: {
          icon: 'logo-markdown',
          title: 'Markdown编辑器'
        },
        component: () => import('@/view/components/markdown/markdown.vue')
      },
      {
        path: 'editor_page',
        name: 'editor_page',
        meta: {
          icon: 'ios-create',
          title: '富文本编辑器'
        },
        component: () => import('@/view/components/editor/editor.vue')
      },
      {
        path: 'icons_page',
        name: 'icons_page',
        meta: {
          icon: '_bear',
          title: '自定义图标'
        },
        component: () => import('@/view/components/icons/icons.vue')
      }
    ]
  },
  {
    path: '/update',
    name: 'update',
    meta: {
      hideInMenu: true,  // 隐藏起来
      icon: 'md-cloud-upload',
      title: '数据上传'
    },
    component: Main,
    children: [
      {
        path: 'update_table_page',
        name: 'update_table_page',
        meta: {
          icon: 'ios-document',
          title: '上传Csv'
        },
        component: () => import('@/view/update/update-table.vue')
      },
      {
        path: 'update_paste_page',
        name: 'update_paste_page',
        meta: {
          icon: 'md-clipboard',
          title: '粘贴表格数据'
        },
        component: () => import('@/view/update/update-paste.vue')
      }
    ]
  },
  {
    path: '/excel',
    name: 'excel',
    meta: {
      hideInMenu: true,  // 隐藏起来
      icon: 'ios-stats',
      title: 'EXCEL导入导出'
    },
    component: Main,
    children: [
      {
        path: 'upload-excel',
        name: 'upload-excel',
        meta: {
          icon: 'md-add',
          title: '导入EXCEL'
        },
        component: () => import('@/view/excel/upload-excel.vue')
      },
      {
        path: 'export-excel',
        name: 'export-excel',
        meta: {
          icon: 'md-download',
          title: '导出EXCEL'
        },
        component: () => import('@/view/excel/export-excel.vue')
      }
    ]
  },
  {
    path: '/tools_methods',
    name: 'tools_methods',
    meta: {
      hideInMenu: true,  // 隐藏起来
    },
    component: Main,
    children: [
      {
        path: 'tools_methods_page',
        name: 'tools_methods_page',
        meta: {
          icon: 'ios-hammer',
          title: '工具方法',
          beforeCloseName: 'before_close_normal'
        },
        component: () => import('@/view/tools-methods/tools-methods.vue')
      }
    ]
  },
  {
    path: '/directive',
    name: 'directive',
    meta: {
      hideInMenu: true,  // 隐藏起来
    },
    component: Main,
    children: [
      {
        path: 'directive_page',
        name: 'directive_page',
        meta: {
          icon: 'ios-navigate',
          title: '指令'
        },
        component: () => import('@/view/directive/directive.vue')
      }
    ]
  },
  {
    path: '/multilevel',
    name: 'multilevel',
    meta: {
      hideInMenu: true,  // 隐藏起来
      icon: 'md-menu',
      title: '多级菜单'
    },
    component: Main,
    children: [
      {
        path: 'level_2_1',
        name: 'level_2_1',
        meta: {
          icon: 'md-funnel',
          title: '二级-1'
        },
        component: () => import('@/view/multilevel/level-2-1.vue')
      },
      {
        path: 'level_2_2',
        name: 'level_2_2',
        meta: {
          access: ['super_admin'],
          icon: 'md-funnel',
          showAlways: true,
          title: '二级-2'
        },
        component: parentView,
        children: [
          {
            path: 'level_2_2_1',
            name: 'level_2_2_1',
            meta: {
              icon: 'md-funnel',
              title: '三级'
            },
            component: () => import('@/view/multilevel/level-2-2/level-3-1.vue')
          }
        ]
      },
      {
        path: 'level_2_3',
        name: 'level_2_3',
        meta: {
          icon: 'md-funnel',
          title: '二级-3'
        },
        component: () => import('@/view/multilevel/level-2-3.vue')
      },
    ]
  },
  {
    path: '/argu',
    name: 'argu',
    meta: {
      hideInMenu: true
    },
    component: Main,
    children: [
      {
        path: 'params/:id',
        name: 'params',
        meta: {
          icon: 'md-flower',
          title: route => `动态路由-${route.params.id}`,
          notCache: true,
          beforeCloseName: 'before_close_normal'
        },
        component: () => import('@/view/argu-page/params.vue')
      },
      {
        path: 'query',
        name: 'query',
        meta: {
          icon: 'md-flower',
          title: route => `带参路由-${route.query.id}`,
          notCache: true
        },
        component: () => import('@/view/argu-page/query.vue')
      }
    ]
  },
  {
    path: '/401',
    name: 'error_401',
    meta: {
      hideInMenu: true,
      notCache: true
    },
    component: () => import('@/view/error-page/401.vue')
  },
  {
    path: '/activeemail/:id/:code',
    name: 'activeemail',
    meta: {
      hideInMenu: true
    },
    component: () => import('@/view/auxiliary/activeemail.vue')
  },
  {
    path: '/500',
    name: 'error_500',
    meta: {
      hideInMenu: true
    },
    component: () => import('@/view/error-page/500.vue')
  },
  {
    path: '*',
    name: 'error_404',
    meta: {
      hideInMenu: true
    },
    component: () => import('@/view/error-page/404.vue')
  },
  {
    path: '/visualizationtable',
    name: 'visualization_table',
    meta: {
      icon: 'md-grid',
      title: '数据表可视化'
    },
    component: Main,
    children: [
      {
        path: 'visualization_post',
        name: 'visualization_post',
        meta: {
          icon: 'ios-speedometer',
          title: '文章相关表'
        },
        component: parentView,
        children: [
          {
            path: 'visualization_post_category',
            name: 'visualization_post_category',
            meta: {
              icon: 'md-grid',
              title: '文章分类表'
            },
            component: () => import('@/view/visualization/category.vue')
          },
          {
            path: 'visualization_post_category_corresponding',
            name: 'visualization_post_category_corresponding',
            meta: {
              icon: 'md-grid',
              title: '文章分类对应表'
            },
            component: () => import('@/view/visualization/category_corresponding.vue')
          },
          {
            path: 'visualization_post_tag',
            name: 'visualization_post_tag',
            meta: {
              icon: 'md-grid',
              title: '文章标签表'
            },
            component: () => import('@/view/visualization/tag.vue')
          },
          {
            path: 'visualization_post_tag_corresponding',
            name: 'visualization_post_tag_corresponding',
            meta: {
              icon: 'md-grid',
              title: '文章标签对应表'
            },
            component: () => import('@/view/visualization/tag_corresponding.vue')
          },
          {
            path: 'visualization_posts',
            name: 'visualization_posts',
            meta: {
              icon: 'md-grid',
              title: '文章表'
            },
            component: () => import('@/view/visualization/post.vue')
          }
        ]
      },
      {
        path: 'visualization_friendlink',
        name: 'visualization_friendlink',
        meta: {
          icon: 'ios-link',
          title: '友情链接表'
        },
        component: () => import('@/view/visualization/friendlink.vue')
      }
    ]
  },
]
