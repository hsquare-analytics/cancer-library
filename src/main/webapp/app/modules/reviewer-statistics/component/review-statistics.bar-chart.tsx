import React, {useEffect, useState} from 'react';
import {Bar} from 'react-chartjs-2';
import {useAppSelector} from "app/config/store";
import {translate} from "react-jhipster";
import MuiColorPalettes from "app/modules/reviewer-statistics/component/mui-color-palettes";


export const options = {
  maintainAspectRatio: false,
  indexAxis: 'y' as const,
  elements: {
    bar: {
      borderWidth: 1,
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

export const ReviewStatisticsBarChart = () => {

  const [labels, setLabels] = useState<string[]>([]);
  const [datasets, setDatasets] = useState<any[]>([]);

  const entities = useAppSelector(state => state.reviewerStatistics.entities);

  useEffect(() => {
    if (entities.length > 0) {
      const sorted = [...entities].sort((a, b) => {
        return (b.submitted + b.approved + b.declined) - (a.submitted + a.approved + a.declined);
      });

      const labels = sorted.map(entity => `${entity.name}(${entity.login})`);
      setLabels(labels);

      const datasets = [];
      const noActionDataset = {
        label: translate('cancerLibraryApp.reviewerStatistics.chartLabel.submitted'),
        data: sorted.map(entity => entity.submitted),
        backgroundColor: MuiColorPalettes.find(palette => palette.title === 'grey')?.data[4],
      };

      const declineDataset = {
        label: translate('cancerLibraryApp.reviewerStatistics.chartLabel.declined'),
        data: sorted.map(entity => entity.declined),
        backgroundColor: MuiColorPalettes.find(palette => palette.title === 'red')?.data[3],
      };

      const approveDataset = {
        label: translate('cancerLibraryApp.reviewerStatistics.chartLabel.approved'),
        data: sorted.map(entity => entity.approved),
        backgroundColor: MuiColorPalettes.find(palette => palette.title === 'blue')?.data[3],
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
