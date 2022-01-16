<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'Tanggal' => date('d-m-Y', strtotime($this->created_at)),
            'Name Merchant' => $this->merchant_name,
            'omzet' => $this->bill_total
        ];
        // return parent::toArray($request);
    }
}
