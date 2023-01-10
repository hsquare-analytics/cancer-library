import React, {useEffect, useState} from 'react';
import {Doughnut} from 'react-chartjs-2';
import {useAppSelector} from "app/config/store";
import MuiColorPalettes from "app/modules/reviewer-statistics/component/mui-color-palettes";


export const options = {
  maintainAspectRatio: false,
  indexAxis: 'y' as const,
  responsive: true,
  plugins: {
    legend: {
      position: 'right' as const,
    },
    title: {
      display: false,
    },
  },
};
const ReviewStatisticsDoughnutChart = () => {
  const [labels, setLabels] = useState<string[]>([]);
  const [datasets, setDatasets] = useState<any[]>([]);

  const loading = useAppSelector(state => state.reviewerStatistics.loading);
  const entities = useAppSelector(state => state.reviewerStatistics.entities);
  const totalPatientCount = useAppSelector(state => state.reviewerStatistics.totalPatientCount);

  useEffect(() => {
    if (entities.length > 0) {

      const temp = [
        {
          label: `제출: `,
          data: [],
          backgroundColor: [],
          borderColor: [],
          borderWidth: 1,
        },
      ];

      const sorted = [...entities].sort((a, b) => {
        return (b.totalSubmitted + b.totalApproved + b.totalDeclined) - (a.totalSubmitted + a.totalApproved + a.totalDeclined);
      });

      const formattedLabel = sorted.map(entity => `${entity.name}(${entity.login})`);
      setLabels(formattedLabel);

      const data = sorted.map(entity => entity.totalSubmitted + entity.totalApproved + entity.totalDeclined);
      const backgroundColor = [];
      const borderColor = [];

      sorted.forEach((entity, index) => {
        const palette = MuiColorPalettes[Math.floor(Math.random() * MuiColorPalettes.length)];
        backgroundColor.push(palette.data[3]);
        borderColor.push(palette.data[2]);
      });

      temp[0].data = data;
      temp[0].backgroundColor = backgroundColor;
      temp[0].borderColor = borderColor;
      setDatasets(temp);

    }

  }, [JSON.stringify(entities)]);

  return !loading && entities.length > 0 && totalPatientCount > 0?
    <Doughnut
      plugins={[
        {
          id: 'custom_doughnut_center_text',
          beforeDraw(chart) {
            const width = chart.width,
              height = chart.height,
              ctx = chart.ctx;
            ctx.restore();
            const fontSize = (height / 300).toFixed(2);
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            const centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
            const centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
            ctx.font = fontSize + "rem Roboto";

            const currentTotal = entities.reduce((acc, cur) => acc + cur.totalSubmitted + cur.totalApproved + cur.totalDeclined, 0);

            ctx.fillText(`${currentTotal} / ${totalPatientCount}`, centerX, centerY);
            // ctx.fillText(`${totalPatientCount}`, centerX, centerY + 10);
            ctx.fillText(`(${(currentTotal/totalPatientCount * 100).toFixed(2)}%)`, centerX, centerY + 40);
            ctx.save();
          }
        }
      ]}
      options={options}
      data={{labels, datasets}}/> : null;
}

export default ReviewStatisticsDoughnutChart;
