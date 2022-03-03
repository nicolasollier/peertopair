import Sortable from "sortablejs"

const list = document.querySelector("#card_list")
const initSortable = () => {
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
  })
}

export { initSortable }
