import { LightningElement } from "lwc";

export default class TemplateLooping extends LightningElement {
  aname = ["Swapnil", "Balasaheb", "Magar"];

  aobj = [
    {
      id: 1,
      name: "Swapnil Magar",
      phone: "9405965819"
    },
    {
      id: 2,
      name: "Krushna Magar",
      phone: "7030307200"
    }
  ];
}