import Controller from "@ember/controller";
import ModalFunctionality from "discourse/mixins/modal-functionality";
import { action } from "@ember/object";
import bootbox from "bootbox";

export default Controller.extend(ModalFunctionality, {
  @action
  saveAndClose() {
    this.send("closeModal");
    bootbox.alert("Status is set.");
  },
});
