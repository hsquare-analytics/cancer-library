import React from 'react';
import {BarElement, CategoryScale, Chart as ChartJS, Legend, LinearScale, Title, Tooltip,} from 'chart.js';
import {Bar} from 'react-chartjs-2';
import {faker} from '@faker-js/faker';

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

const labels = ['kcure01', 'kcure02', 'kcure03', 'kcure04', 'kcure05', 'kcure06', 'kcure07', 'kcure08', 'kcure09', 'kcure10'];

export const data = {
  labels,
  datasets: [
    {
      label: 'no action ',
      data: labels.map(() => faker.datatype.number({min: 0, max: 1000})),
      backgroundColor: 'rgba(255, 205, 86, 0.5)',
    },
    {
      label: 'decline',
      data: [10, 20, 30, 40, 50],
      backgroundColor: 'rgba(255, 99, 132, 0.5)',
    },
    {
      label: 'approve',
      data: labels.map(() => faker.datatype.number({min: 0, max: 1000})),
      backgroundColor: 'rgba(53, 162, 235, 0.5)',
    }
  ],
};

export const BarChart = () => {
  return <Bar options={options} data={data}/>;
};

export default BarChart;
