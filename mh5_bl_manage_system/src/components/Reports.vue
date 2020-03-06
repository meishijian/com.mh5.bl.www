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
....
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
      title: {
        text: "数据销量--加载"
      },
      legend: {
        data: ["销量"]
      },
      visualMap: {
        show: false,
        min: 80,
        max: 600,
        inRange: {
          colorLightness: [0, 1]
        }
      },
      series: [
        {
          name: "访问来源",
          type: "pie",
          radius: "85%",
          data: [
            { value: 235, name: "衬衫" },
            { value: 274, name: "羊毛衫" },
            { value: 310, name: "袜子" },
            { value: 335, name: "高跟鞋" },
            { value: 400, name: "化妆品" }
          ],
          roseType: "angle",
          label: {
            normal: {
              textStyle: {
                color: "rgba(3, 116, 116, 0.9)"
              }
            }
          },
          labelLine: {
            normal: {
              lineStyle: {
                color: "rgba(78, 141, 141, 0.9)"
              }
            }
          },
          itemStyle: {
            normal: {}
          }
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
    color: rgb(78, 141, 141);
  }
}
</style>