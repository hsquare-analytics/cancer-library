export const getDxButtonColumns = (navigate) => [
  {
    hint: "View", icon: "check", onClick: (e) => navigate(`./${e.row.data.id}`)
  },
  {
    hint: "Edit", icon: "edit", onClick: (e) => navigate(`./${e.row.key.id}/edit`)
  },
  {
    hint: "Delete", icon: "trash", onClick: (e) => navigate(`./${e.row.key.id}/delete`)
  }
];
