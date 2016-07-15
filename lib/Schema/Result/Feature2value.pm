use utf8;
package Schema::Result::Feature2value;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Feature2value

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<feature2value>

=cut

__PACKAGE__->table("feature2value");

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 default

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

0 - ???
1 - ??

=head2 feature_type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "default",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "feature_type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "value",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</feature_id>

=back

=cut

__PACKAGE__->set_primary_key("feature_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<feature_id_UNIQUE>

=over 4

=item * L</feature_id>

=item * L</feature_type_id>

=item * L</value>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "feature_id_UNIQUE",
  ["feature_id", "feature_type_id", "value"],
);

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Schema::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Schema::Result::Feature",
  { feature_id => "feature_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 feature_type

Type: belongs_to

Related object: L<Schema::Result::FeatureType>

=cut

__PACKAGE__->belongs_to(
  "feature_type",
  "Schema::Result::FeatureType",
  { feature_type_id => "feature_type_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-30 14:26:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BFMQ46nvZKlQtlHyPW3Wkg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
