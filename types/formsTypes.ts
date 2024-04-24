export interface FieldType {
  name: string
  type: string
  label: string
  value: string
  options: Array<{ label: string; value: string }>
  required: boolean
  unique: boolean
  ref: string
}
