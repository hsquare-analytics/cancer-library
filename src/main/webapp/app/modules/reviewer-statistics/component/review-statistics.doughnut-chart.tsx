import React, {useEffect, useState} from 'react';
import {Pie} from 'react-chartjs-2';
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

  const entities = useAppSelector(state => state.reviewerStatistics.entities);

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

      // const RandomColor = () => {
      //   const r = Math.floor(Math.random() * 256);
      //   const g = Math.floor(Math.random() * 256);
      //   const b = Math.floor(Math.random() * 256);
      //   return {
      //     backgroundColor: `rgba(${r}, ${g}, ${b}, 0.2)`,
      //     borderColor: `rgba(${r}, ${g}, ${b}, 0.8)`,
      //   }
      // }

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

  return <Pie
    options={options}
    data={{labels, datasets}}/>;
}

export default ReviewStatisticsDoughnutChart;
