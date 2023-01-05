import React, {useEffect, useState} from 'react';
import {Chart as ChartJS, ArcElement, Tooltip, Legend} from 'chart.js';
import {Doughnut} from 'react-chartjs-2';
import {Pie} from 'react-chartjs-2';
import {useAppSelector} from "app/config/store";


ChartJS.register(ArcElement, Tooltip, Legend);

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

      const RandomColor = () => {
        const r = Math.floor(Math.random() * 256);
        const g = Math.floor(Math.random() * 256);
        const b = Math.floor(Math.random() * 256);
        return {
          backgroundColor: `rgba(${r}, ${g}, ${b}, 0.2)`,
          borderColor: `rgba(${r}, ${g}, ${b}, 0.8)`,
        }
      }

      const sorted = [...entities].sort((a, b) => {
        return (b.submitted + b.approved + b.declined) - (a.submitted + a.approved + a.declined);
      });

      const labels = sorted.map(entity => `${entity.name}(${entity.login})`);
      setLabels(labels);

      const data = sorted.map(entity => entity.submitted + entity.approved + entity.declined);
      const backgroundColor = [];
      const borderColor = [];

      sorted.forEach((entity, index) => {
        const color = RandomColor();
        backgroundColor.push(color.backgroundColor);
        borderColor.push(color.borderColor);
      });

      temp[0].data = data;
      temp[0].backgroundColor = backgroundColor;
      temp[0].borderColor = borderColor;
      setDatasets(temp);
    }

  }, [JSON.stringify(entities)]);

  return <Pie data={{
    labels: labels,
    datasets: datasets
  }}/>;
}

export default ReviewStatisticsDoughnutChart;
