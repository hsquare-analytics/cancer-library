import React, {useEffect, useState} from 'react';
import {Chart as ChartJS, ArcElement, Tooltip, Legend} from 'chart.js';
import {Doughnut} from 'react-chartjs-2';
import {Pie} from 'react-chartjs-2';
import {useAppSelector} from "app/config/store";
import {translate} from "react-jhipster";


ChartJS.register(ArcElement, Tooltip, Legend);

export const data = {
  labels: ['kcure01', 'kcure02', 'kcure03', 'kcure04', 'kcure05', 'kcure06', 'kcure07', 'kcure08', 'kcure09', 'kcure10'],
  datasets: [
    {
      label: '# of Votes',
      data: [12, 19, 3, 5, 2, 3, 1, 2, 3, 4],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
      ],
      borderWidth: 1,
    },
  ],
};

const ReviewStatisticsDoughnutChart = () => {
  const [labels, setLabels] = useState<string[]>([]);
  const [datasets, setDatasets] = useState<any[]>([]);

  const entities = useAppSelector(state => state.reviewerStatistics.entities);

  useEffect(() => {
    if (entities.length > 0) {
      const labels = entities.map(entity => `${entity.name}(${entity.login})`);
      setLabels(labels);

      const totalCount = entities.map(entity => entity.submitted + entity.approved + entity.declined).reduce((a, b) => a + b, 0);

      const temp = [
        {
          label: `제출: `,
          data: [],
          backgroundColor: [],
          borderColor: [ ],
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

      const data = entities.map(entity => entity.submitted + entity.approved + entity.declined);
      const backgroundColor = [];
      const borderColor = [];
      entities.forEach((entity, index) => {
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

  return <Doughnut data={{
    labels: labels,
    datasets: datasets
  }}/>;
}

export default ReviewStatisticsDoughnutChart;
