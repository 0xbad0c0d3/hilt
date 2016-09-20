use utf8;
package Schema::Result::VProductInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::VProductInfo - VIEW

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<v_product_info>

=cut

__PACKAGE__->table("v_product_info");
__PACKAGE__->result_source_instance->view_definition("select `tb1`.`category_id` AS `category_id`,`tb2`.`product_id` AS `product_id`,`tb2`.`user_id` AS `user_id`,`tb2`.`supplier_id` AS `supplier_id`,`tb2`.`depth` AS `depth`,`tb2`.`width` AS `width`,`tb2`.`heigth` AS `heigth`,`tb2`.`weight` AS `weight`,`tb2`.`quantity` AS `quantity`,`tb2`.`unit_id` AS `unit_id`,`tb2`.`rating` AS `rating`,`tb2`.`url` AS `url`,`tb2`.`title` AS `title`,`tb2`.`tag_title` AS `tag_title`,`tb2`.`description` AS `description`,`tb2`.`tag_description` AS `tag_description`,`tb2`.`tag_keywords` AS `tag_keywords`,`tb2`.`date_create` AS `date_create`,`tb2`.`date_update` AS `date_update`,`tb3`.`title` AS `category_name`,`tb3`.`url2site` AS `url2site`,`tb3`.`instr` AS `instr`,`tb3`.`url` AS `caterory_url`,`tb4`.`code` AS `unit_code`,`tb4`.`code2` AS `unit_code2`,`tb4`.`name` AS `unit_name` from (((`hilt`.`product2category` `tb1` join `hilt`.`product` `tb2` on((`tb1`.`product_id` = `tb2`.`product_id`))) join `hilt`.`category` `tb3` on((`tb1`.`category_id` = `tb3`.`category_id`))) join `hilt`.`unit` `tb4` on((`tb2`.`unit_id` = `tb4`.`unit_id`)))");

=head1 ACCESSORS

=head2 category_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 product_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

Êòî çàâåë ïðîäóêò

=head2 supplier_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 depth

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 width

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 heigth

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 weight

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 quantity

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 unit_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rating

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 tag_title

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 1000

=head2 tag_description

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 tag_keywords

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 date_create

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 date_update

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 category_name

  data_type: 'varchar'
  is_nullable: 0
  size: 500

=head2 url2site

  data_type: 'varchar'
  is_nullable: 0
  size: 1000

=head2 instr

  data_type: 'text'
  is_nullable: 0

=head2 caterory_url

  data_type: 'varchar'
  is_nullable: 0
  size: 500

=head2 unit_code

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 unit_code2

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 unit_name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "category_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "product_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "supplier_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "depth",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "width",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "heigth",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "weight",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "quantity",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "unit_id",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "rating",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "tag_title",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 1000 },
  "tag_description",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "tag_keywords",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "date_create",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "date_update",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "category_name",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "url2site",
  { data_type => "varchar", is_nullable => 0, size => 1000 },
  "instr",
  { data_type => "text", is_nullable => 0 },
  "caterory_url",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "unit_code",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "unit_code2",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "unit_name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-19 16:17:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZTAgTRgyGwSNeTN36VFVvQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
