import React, {useEffect, useState} from 'react';
import {BarElement, CategoryScale, Chart as ChartJS, Legend, LinearScale, Title, Tooltip,} from 'chart.js';
import {Bar} from 'react-chartjs-2';
import {useAppSelector} from "app/config/store";
import {translate} from "react-jhipster";

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

export const options = {
  maintainAspectRatio: false,
  indexAxis: 'y' as const,
  elements: {
    bar: {
      borderWidth: 2,
    },
  },
  responsive: true,
  scales: {
    x: {
      stacked: true,
    },
    y: {
      stacked: true,
    }
  },
  plugins: {
    legend: {
      position: 'top' as const,
    },
    title: {
      display: false,
    },
  },
};

// const labels = ['kcure01', 'kcure02', 'kcure03', 'kcure04', 'kcure05', 'kcure06', 'kcure07', 'kcure08', 'kcure09', 'kcure10'];
//
// export const data = {
//   labels,
//   datasets: [
//     {
//       label: 'no action ',
//       data: labels.map(() => faker.datatype.number({min: 0, max: 1000})),
//       backgroundColor: 'rgba(255, 205, 86, 0.5)',
//     },
//     {
//       label: 'decline',
//       data: [10, 20, 30, 40, 50],
//       backgroundColor: 'rgba(255, 99, 132, 0.5)',
//     },
//     {
//       label: 'approve',
//       data: labels.map(() => faker.datatype.number({min: 0, max: 1000})),
//       backgroundColor: 'rgba(53, 162, 235, 0.5)',
//     }
//   ],
// };

export const ReviewStatisticsBarChart = () => {

  const [labels, setLabels] = useState<string[]>([]);
  const [datasets, setDatasets] = useState<any[]>([]);

  const entities = useAppSelector(state => state.reviewerStatistics.entities);

  useEffect(() => {
    if (entities.length > 0) {
      const labels = entities.map(entity => `${entity.name}(${entity.login})`);
      setLabels(labels);

      const datasets = [];
      const noActionDataset = {
        label: translate('cancerLibraryApp.reviewerStatistics.chartLabel.submitted'),
        data: entities.map(entity => entity.submitted),
        backgroundColor: 'rgba(255, 205, 86, 0.5)',
      };

      const declineDataset = {
        label: translate('cancerLibraryApp.reviewerStatistics.chartLabel.declined'),
        data: entities.map(entity => entity.declined),
        backgroundColor: 'rgba(255, 99, 132, 0.5)',
      };

      const approveDataset = {
        label: translate('cancerLibraryApp.reviewerStatistics.chartLabel.approved'),
        data: entities.map(entity => entity.approved),
        backgroundColor: 'rgba(53, 162, 235, 0.5)',
      };

      datasets.push(noActionDataset);
      datasets.push(declineDataset);
      datasets.push(approveDataset);

      setDatasets(datasets);
    }

  }, [JSON.stringify(entities)]);


  return <Bar options={options} data={{
    labels,
    datasets
  }}/>;
};

export default ReviewStatisticsBarChart;
