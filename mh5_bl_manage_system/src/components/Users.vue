<template>
  <div class="users">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>用户管理</el-breadcrumb-item>
      <el-breadcrumb-item>用户信息</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片 -->
    <el-card class="box-card">
      <br />
      <br />
      <!-- 表格 -->
      <el-table :data="imageData" border style="width: 100%">
        <el-table-column type="index" width="50"></el-table-column>
        <el-table-column prop="mobile" label="用户名"></el-table-column>
        <!-- <el-table-column prop="password" label="密码"></el-table-column> -->
        <el-table-column prop="face" label="头像">
          <template slot-scope="scoped">
            <img :src="scoped.row.face" width="150px" alt srcset />
          </template>
        </el-table-column>
        <el-table-column prop="nickname" label="昵称"></el-table-column>
        <el-table-column prop="sex" label="性别"></el-table-column>
        <el-table-column prop="birth" label="出生年月"></el-table-column>
        <el-table-column prop="preference" label="偏好"></el-table-column>
        <!-- <el-table-column prop="license" label="车牌"></el-table-column> -->
        <el-table-column prop="email" label="邮箱"></el-table-column>
        <!-- <el-table-column prop="payment" label="支付密码"></el-table-column> -->
        <el-table-column prop="username" label="真实姓名"></el-table-column>
        <el-table-column prop="certificates_number" label="证件号码"></el-table-column>
        <el-table-column prop="integral" label="积分"></el-table-column>
        <el-table-column label="注册账号的时间" width="170">
          <template slot-scope="scoped">{{scoped.row.regtime | dateFormat}}</template>
        </el-table-column>
      </el-table>

      <br />
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="catInfo.pagenum"
        :page-sizes="[2, 5, 10, 15]"
        :page-size="catInfo.pagesize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>
  </div>
</template>
<script>
export default {
  data() {
    return {
      //轮播图数据
      imageData: [],
      catInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 2 // 每页显示多少条数据
      },
      // 总数
      total: 0
    };
  },
  created() {
    this.imageList();
  },
  methods: {
    // 分页 当前页数量
    handleSizeChange(val) {
      // 修改 数量
      this.catInfo.pagesize = val;
      // 渲染 分类目录数据
      this.imageList();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.catInfo.pagenum = val;
      // 渲染 分类目录数据
      this.imageList();
    },
    //轮播图
    imageList() {
      this.$http.get("/users_list", { params: this.catInfo }).then(res => {
        // console.log(res);
        this.imageData = res.data.data;
        // 总数
        this.total = res.data.total;
        // console.log(this.imageList);
      });
    }
  }
};
</script>
<style lang="less">
.users {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>