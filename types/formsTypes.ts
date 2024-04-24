export interface FieldType {
  name: string
  type: string
  label: string
  value: string
  options: OptionType[]
  required: boolean
  unique: boolean
  ref: string
}

export interface OptionType {
  label: string
  value: string
  validated: boolean
}
