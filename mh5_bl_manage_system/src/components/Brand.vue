<template>
  <div class="brand">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>商家店铺</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片 -->
    <el-card class="box-card">
      <!-- 表格 -->
      <el-table :data="brandData" border style="width: 100%">
        <el-table-column type="index" width="50"></el-table-column>
        <el-table-column prop="bra_name" label="店铺名称"></el-table-column>
        <el-table-column prop="bra_image" label="店铺图标">
          <template slot-scope="scoped">
            <img :src="scoped.row.bra_image" width="80px" alt srcset />
          </template>
        </el-table-column>
        <!-- <el-table-column prop="bra_region" label="店铺地区"></el-table-column>
        <el-table-column prop="bra_introduce" label="店铺介绍"></el-table-column>-->
        <el-table-column prop="regtime" label="店铺创建时间">
          <template slot-scope="scoped">{{scoped.row.regtime | dateFormat}}</template>
        </el-table-column>
        <el-table-column label="操作">
          <template>
            <el-button type="primary" icon="el-icon-edit" size="mini">编辑</el-button>
            <el-button type="danger" icon="el-icon-delete" size="mini">删除</el-button>
          </template>
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
      // 店铺数据
      brandData: [],
      catInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 5 // 每页显示多少条数据
      },
      total: 0 // 总数
    };
  },
  created() {
    //   渲染 店铺数据
    this.getBrandData();
  },
  methods: {
    // 分页 当前页数量
    handleSizeChange(val) {
      // 修改 数量
      this.catInfo.pagesize = val;
      // 渲染 分类目录数据
      this.getBrandData();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.catInfo.pagenum = val;
      // 渲染 分类目录数据
      this.getBrandData();
    },
    //   渲染 店铺数据
    getBrandData() {
      this.$http
        .get("/goods_list_brand", { params: this.catInfo })
        .then(res => {
          //   console.log(res);
          this.brandData = res.data.data;
          // 总数
          this.total = res.data.total;
        });
    }
  }
};
</script>

<style lang="less">
.brand {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>