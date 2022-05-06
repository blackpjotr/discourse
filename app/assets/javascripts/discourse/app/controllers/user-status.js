import Controller from "@ember/controller";
import ModalFunctionality from "discourse/mixins/modal-functionality";
import { action } from "@ember/object";
import bootbox from "bootbox";
import { notEmpty } from "@ember/object/computed";

export default Controller.extend(ModalFunctionality, {
  userStatus: "",
  statusIsSet: notEmpty("userStatus"),

  @action
  saveAndClose() {
    this.send("closeModal");
    bootbox.alert(`The new status is "${this.userStatus}"`);
  },
});
