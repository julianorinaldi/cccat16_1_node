import { UUID } from "crypto";

export default class Signup {
    constructor (readonly name: string) {
    }

    account_id!: UUID;

}