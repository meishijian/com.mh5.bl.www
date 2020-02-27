<template>
  <div class="reports">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>数据管理</el-breadcrumb-item>
      <el-breadcrumb-item>数据报表</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 卡片 -->
    <el-card class="box-card">
      <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
      <div ref="main" id="main" style="width: 750px;height:400px;"></div>
    </el-card>
  </div>
</template>

<script>
// 导入 echart
import echarts from "echarts";
// 导入 lodash
import _ from "lodash";
export default {
  mounted() {
    // 基于准备好的dom，初始化echarts实例
    const myChart = echarts.init(this.$refs.main);
    // // 查询数据
    // const { data: res } = await this.$http.get("reports/type/1");
    // // console.log(res);
    // // 判断
    // if (res.meta.status !== 200)
    //   return this.$message.error("获取数据报表数据失败");
    // 指定图表的配置项和数据 需要被合并的数据
    // 指定图表的配置项和数据
    var option = {
      xAxis: {
        type: "value"
      },
      yAxis: {
        type: "value"
      },
      dataZoom: [
        {
          // 这个dataZoom组件，默认控制x轴。
          type: "slider", // 这个 dataZoom 组件是 slider 型 dataZoom 组件
          start: 10, // 左边在 10% 的位置。
          end: 60 // 右边在 60% 的位置。
        }
      ],
      series: [
        {
          type: "scatter", // 这是个『散点图』
          itemStyle: {
            opacity: 0.8
          },
          symbolSize: function(val) {
            return val[2] * 40;
          },
          data: [
            ["14.616", "7.241", "0.896"],
            ["3.958", "5.701", "0.955"],
            ["2.768", "8.971", "0.669"],
            ["9.051", "9.710", "0.171"],
            ["14.046", "4.182", "0.536"],
            ["12.295", "1.429", "0.962"],
            ["4.417", "8.167", "0.113"],
            ["0.492", "4.771", "0.785"],
            ["7.632", "2.605", "0.645"],
            ["14.242", "5.042", "0.368"]
          ]
        }
      ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
  }
};
</script>
<style lang="less">
.reports {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>